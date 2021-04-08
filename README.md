#Rename Computer

This Powershell script can change computer name in domain remotely, with csv file contain old and new computer name.
Remove ".txt" from computers file.

CSV files should contain old,new header

set the execution policy by typing this into your PowerShell window (Run as Administrator):
     
     Set-ExecutionPolicy RemoteSigned

set back the execution policy:
 
     Set-ExecutionPolicy Restricted
