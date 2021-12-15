param(
    [int]$Length =$(Read-Host "how long would you like the password to be?"),
    [switch]$NoUpperCase,
    [switch]$NoLowerCase,
    [switch]$NoNumbers,
    [switch]$NoSpecialCharecters,
    [switch]$CopyToClipboard
)
While($PasswordString.Length -lt $Length)
{
    $char = @()
    if(!$NoLowerCase){$char += -join ((97..122) | Get-Random -Count "1" | % {[char]$_})}  #Lower Case
    if(!$NoUpperCase){$char += -join ((65..90) | Get-Random -Count "1" | % {[char]$_})}   #Upper Case
    if(!$NoNumbers){$char += -join ((49..57) | Get-Random -Count "1" | % {[char]$_})}   #Numbers
    if(!$NoSpecialCharecters){$char += -join ((35..38) + (40..43) + (58..64) | Get-Random -Count "1" | % {[char]$_})}     #Special Characters
    $PasswordString += $char | Get-Random
}
if($CopyToClipboard){Set-Clipboard -Value $PasswordString}

return $PasswordString 
