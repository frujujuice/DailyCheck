#Sets the Execution Policy and add Exchange Snapin
Set-ExecutionPolicy Bypass -Scope CurrentUser

#Connects to your servers to see if they are up or down
$servers = "Server1","Server2","Server3","Server4","Server5","Server6","Server7","Server8","Server9","Server10","Server11","Server12","Server13","Server14","Server15","Server16","Server17","Server18","Server19","Server20","Server21","Server22","Server23","Server24","Server25","Server26"
$ServerGroup1 = $()
foreach ($server in $servers)
{
    $status = @{ "ServerName" = $server; "TimeStamp" = (Get-Date -f s) }
    if (Test-Connection $server -Count 1 -ea 0 -Quiet)
    { 
        $status["Results"] = "Up"
    } 
    else 
    { 
        $status["Results"] = "Down" 
    }
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $ServerGroup1 += $serverStatus

}

#Connects to second group of servers to see if they are up or down
$servers = "ExternalServer1","ExternalServer2","ExternalServer3"
$ServerGroup2 = $()
foreach ($server in $servers)
{
    $status = @{ "ServerName" = $server; "TimeStamp" = (Get-Date -f s) }
    if (Test-Connection $server -Count 1 -ea 0 -Quiet)
    { 
        $status["Results"] = "Up"
    } 
    else 
    { 
        $status["Results"] = "Down" 
    }
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $ServerGroup2 += $serverStatus

}

#Greeting message to make you feel warm and fuzzy
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Good morning! Enjoy the scans!!  :-)"

# Gets todays date and adds it to a output text file
get-date | out-file "\\server\Daily Checks\Dailycheck.txt" -append

#Backup Server 1 Entry Field
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Backup Server 1 Status:" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Time Taken                               - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Errors                                   - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Tapes Dismounted?                        - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append

#Backup Server 2 Entry Field
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Backup Server 2 Status:" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Time Taken                               - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Errors                                   - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Tapes Dismounted?                        - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append

#Server Disk Space Manual input area
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "SERVER DISK SPACE: " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Server Name                              - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Space left on disk                       - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "~~~~~~~~~~ " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Server Name                              - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Space left on disk                       - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "~~~~~~~~~~ " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Server Name                              - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Space left on disk                       - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append

# Email Checks
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "HELPDESK EMAIL CHECKS:" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Syslog Emails                            - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Backup Server 1 Emails                   - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Backup Server 2 Emails                   - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Application Server Emails                - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "WSUS                                     - " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "" -append

out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append

#Output command line for above containers
$ServerGroup1 | out-file "\\server\Daily Checks\Dailycheck.txt" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append
$ServerGroup2 | out-file "\\server\Daily Checks\Dailycheck.txt" -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append

#Connects to the websites to see if they is up or down
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Website Availability" -append

#website1.com
$HTTP_Request = [System.Net.WebRequest]::Create('www.website1.com')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode
If ($HTTP_Status -eq 200) { 
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website1.com is UP!" -append 
}
Else {
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website1.com is DOWN!" -append
}
$HTTP_Response.Close()

##################################################################################################################################################
##################################################################################################################################################

#website2.com
$HTTP_Request = [System.Net.WebRequest]::Create('www.website2.com')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode
If ($HTTP_Status -eq 200) { 
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website2.com is UP!" -append 
}
Else {
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website2.com is DOWN!" -append
}
$HTTP_Response.Close()

##################################################################################################################################################
##################################################################################################################################################

#website3.com
$HTTP_Request = [System.Net.WebRequest]::Create('www.website3.com')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode
If ($HTTP_Status -eq 200) { 
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website3.com is UP!" -append 
}
Else {
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website3.com is DOWN!" -append
}
$HTTP_Response.Close()

##################################################################################################################################################
##################################################################################################################################################

#website4.com
$HTTP_Request = [System.Net.WebRequest]::Create('www.website4.com')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode
If ($HTTP_Status -eq 200) { 
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website4.com is UP!" -append 
}
Else {
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "www.website4.com is DOWN!" -append
}
$HTTP_Response.Close()

##################################################################################################################################################
##################################################################################################################################################

#website5.com
$HTTP_Request = [System.Net.WebRequest]::Create('website5.com')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode
If ($HTTP_Status -eq 200) { 
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "website5.com is UP!" -append 
}
Else {
    out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "website5.com is DOWN!" -append
}
$HTTP_Response.Close()

##################################################################################################################################################
##################################################################################################################################################


#A few extra line breaks to help separate tests
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append

out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append

# Search AD for Disabled Accounts and print out the first name, surname and account name
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Disable AD Accounts" -append
Get-ADUser -Filter {Enabled -eq $false} -SearchBase "OU=Users,OU=WhateverYourOUNameIs,DC=domain,DC=com" | FT GivenName, Surname | out-file "\\server\Daily Checks\Dailycheck.txt" -append

#A few extra line breaks to help separate tests
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append

out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append


# Imports VMware PowerShell snappin
Get-PSSnapin -Registered vm* | Add-PSSnapin
Connect-VIServer VMWareHost1

#Appends line to output file, then checks for any snapshots on the VMware ESX host
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "VM SNapshot" -append
Get-VM | get-snapshot | select Name,Description,VM,PowerState,created,SizeMB |  out-file "\\server\Daily Checks\Dailycheck.txt" -append

#A few extra line breaks to help separate tests
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject " " -append

out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append


# Imports PowerShell session from the Exchange Server
$a = New-PSSession -ConfigurationName microsoft.exchange -ConnectionUri http://MailServer1/powershell
Import-PSSession $a -AllowClobber


#Exchange Server Database Mounting Status
out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "Mail Server Mounted" -append
Get-MailboxDatabase -Server MailServer1 -status | select-object name,mounted,server | out-file "\\server\Daily Checks\Dailycheck.txt" -append
Get-MailboxDatabaseCopyStatus -Server MailServer2 | Select-Object name,status | out-file "\\server\Daily Checks\Dailycheck.txt" -append

out-file "\\server\Daily Checks\Dailycheck.txt" -inputobject "############################################################################" -append


# Converts the .txt file to a .htm table
$SourceFile = "\\server\Daily Checks\Dailycheck.txt"
$TargetFile = "\\server\Daily Checks\Dailycheck.htm"

$File = Get-Content $SourceFile
$FileLine = @()
Foreach ($Line in $File) {
 $MyObject = New-Object -TypeName PSObject
 Add-Member -InputObject $MyObject -Type NoteProperty -Name . -Value $Line
 $FileLine += $MyObject
}
$FileLine | ConvertTo-Html -Property . -body "<H2>Daily Healthcheck</H2>" | Out-File $TargetFile