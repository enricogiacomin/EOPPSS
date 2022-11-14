﻿$Records = Get-mailbox -ResultSize Unlimited| where {$_.emailaddresses -like "smtp:*@aimacqua.it"} | Select-Object DisplayName,@{Name=“EmailAddresses”;Expression={$_.EmailAddresses |Where-Object {$_ -like “smtp:*aimacqua.it”}}}
 
foreach ($record in $Records)
{
    write-host "Removing Alias" $record.EmailAddresses "for" $record.DisplayName
    Set-Mailbox $record.DisplayName -EmailAddresses @{Remove=$record.EmailAddresses}
}