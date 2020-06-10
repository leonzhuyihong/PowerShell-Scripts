﻿Connect-MsolService
 
$users = Get-MsolUser
$IntuneunlicensedUsers = @()
foreach ($user in $users)
{
    if (-Not $user.Licenses.ServiceStatus)
    {
       $IntuneunlicensedUsers += $user.UserPrincipalName
    }
    elseif ("INTUNE_A" -notin $user.Licenses.ServiceStatus.ServicePlan.ServiceName)
    {
        $IntuneunlicensedUsers += $user.UserPrincipalName
   }
}

Write-Host("Intune Unlicensed users are:")
Write-Output("")
Write-Output($IntuneunlicensedUsers) 


Write-Output("")
Read-Host 'Press Enter to exit…'