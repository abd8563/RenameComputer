#This script can change computer name in domain or workgroup
#create CSV file contain old,new computer name

clear

#Get Credential to change computer name
echo "Set Your Credential to changing computer Name"
start-sleep -s 2
$credential = Get-Credential 
clear


#Create folder for log files
$DirLog = "C:\ScriptLogs\ChangeComputer"
$Test = Test-Path $DirLog


If ($Test -eq "True") {
Write-Host "Folder Already Exist" }

else {
Write-Host ("Create ChangeComputer In SystemDrive")
(mkdir C:\ScriptLogs\ChangeComputer) }


start-sleep -s 2

(echo ("Log File Saved in C:\ScriptLogs\ChangeComputer"))
Start-Sleep -s 2
Clear

#Create Log Files
$Name = @()

#Get csv Files contain old,new computer name
echo "Select your CSV file"
start-sleep -s 2
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.filter = "CSV (*.csv) | *.csv"
$OpenFileDialog.ShowDialog() | Out-Null



$FileName = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")            
$log = New-Item -itemType File -Path c:\ScriptLogs\ChangeComputer -Name ($FileName  +  $Name + ".log")
echo ("****$Name Computer Rename****") >> $log


#Rename Computer Names
echo ---------------------------------------------------------- >> $log
date >> $log

$comps = Import-Csv $OpenFileDialog.FileName -Header old,New

foreach ($server in $comps) {Rename-Computer -ComputerName $server.Old -NewName $server.New -DomainCredential $credential -Force -PassThru -Verbose >> $log}
echo ---------------------------------------------------------- >> $log
echo "Done" >> $log
Write-Host DONE

#Open log folder
Start C:\ScriptLogs\ChangeComputer