# TERMINAL WINDOW TITLE
if ($IsLinux) { $Username = $(whoami) } else { $Username = $env:USERNAME }
$host.ui.RawUI.WindowTitle = "$Username @ $(hostname)"

# COMMAND PROMPT
function prompt { Write-Host -noNewline -foregroundColor yellow "`n➤"; return " " }

# ALIAS NAMES
Remove-Item alias:pwd -force -errorAction SilentlyContinue
Set-Alias -name pwd -value list-workdir.ps1	# pwd = print working directory
Set-Alias -name ll -value Get-ChildItem		# ll = list folder (long format)
Remove-Item alias:ls -force -errorAction SilentlyContinue 
Set-Alias -name ls -value list-folder.ps1	# ls = list folder (short format)
