#Rename Computer

This Powershell script can change computer name in domain remotely, with csv file contain old and new computer name.
Remove ".txt" from computers file.

CSV file should contain  [old,new] header.

to set the execution policy to RemoteSigned:
     
     Set-ExecutionPolicy RemoteSigned

to set back the execution defult policy:
 
     Set-ExecutionPolicy Restricted
