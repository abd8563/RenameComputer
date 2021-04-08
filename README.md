#Rename Computer

This simple Powershell script can change computers name in domain remotely without any third partty app.

to use script:

CSV file should contain  [old,new]  header.

set the execution policy to RemoteSigned:
     
     Set-ExecutionPolicy RemoteSigned

after job done set back the execution to defult policy:
 
     Set-ExecutionPolicy Restricted
