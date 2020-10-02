Set-PSReadLineOption -EditMode Vi -ViModeIndicator Cursor
Set-PSReadLineKeyHandler -ViMode Insert -Chord 'Ctrl+Spacebar' -Function MenuComplete
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Darkblood
