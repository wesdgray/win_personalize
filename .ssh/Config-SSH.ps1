Copy-Item ./* ~/.ssh/

$SSH_AGENT = Get-Service ssh-agent
$SSH_AGENT | Set-Service -StartupType Automatic
$SSH_Agent | Start-Service

ssh-add id_rsa_stash

[System.Environment]::SetEnvironmentVariable('GIT_SSH', $(where.exe ssh), [System.EnvironmentVariableTarget]::User)