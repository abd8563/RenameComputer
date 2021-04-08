#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                change computer name in domain or workgroup
                https://github.com/abd8563/RenameComputer.git
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Set LogFolder

$delay = ("start-sleep -s 2")
$logspath = "$env:HOMEDRIVE\Renamelog"

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
clear
write-host ("Make csv file before continuing the script")
Invoke-Expression $delay
clear

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Get Credential to change computer name
echo "Set Your Credential"
$credential = Get-Credential 
clear

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Create folder for log files
$testdir = Test-Path $logspath

If ($testdir -eq "False")
    {Write-Host "folder exist"}
else
    {Write-Host ("Create folder " + $logspath)
    Invoke-Expression $delay
    (mkdir $logspath) }


write-host ("Log file save in " + $logspath)
Invoke-Expression $delay
Clear

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$FileName = (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")            
$log = New-Item -itemType File -Path $logspath -Name ($FileName  + ".log")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Get csv Files contain old,new computer name
echo "Select your CSV file"
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.filter = "CSV (*.csv) | *.csv"
$OpenFileDialog.ShowDialog() | Out-Null

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Rename Computers

echo ("**** Rename Computers ****") >> $log
echo ---------------------------------------------------------- >> $log
date >> $log

$comps = Import-Csv $OpenFileDialog.FileName -Header old,New

foreach ($server in $comps) {Rename-Computer -ComputerName $server.Old -NewName $server.New -DomainCredential $credential -Force -PassThru -Verbose >> $log}
echo ---------------------------------------------------------- >> $log
echo "Done" >> $log
Write-Host DONE
Write-Host "Open log file"
Invoke-Expression $delay
Start $log

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
