function ln($target, $path) { New-Item -ItemType SymbolicLink -Path $path -Target $target }

function which($cmd) { (Get-Command $cmd).Definition }

function touch($path) { New-Item -ItemType File -Path $path -Force }

#function global:prompt {
#    "PS [" + (Get-Date).ToShortTimeString()+"] " + $(Split-Path $pwd -Leaf) + " $ "
#}

function global:prompt {
    ## User
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    if ($IsAdmin) {
        Write-Host -Object "PS " -NoNewline -ForegroundColor Red
    } else {
        Write-Host -Object "PS " -NoNewline -ForegroundColor Green
    }

    ## History ID
    $HistoryId = $MyInvocation.HistoryId
    # Uncomment below for leading zeros
    # $HistoryId = '{0:d4}' -f $MyInvocation.HistoryId
    Write-Host -Object "$HistoryId`: " -NoNewline -ForegroundColor Cyan

    ## Path
    $Drive = $pwd.Drive.Name
    $Pwds = $pwd -split "\\" | Where-Object { -Not [String]::IsNullOrEmpty($_)  }
    $PwdPath = if ($Pwds.Count -gt 3) {
        $ParentFolder = Split-Path -Path (Split-Path -Path $pwd -Parent) -Leaf
        $CurrentFolder = Split-Path -Path $pwd -Leaf
        "..\$ParentFolder\$CurrentFolder"
    } elseif ($Pwds.Count -eq 3) {
        $ParentFolder = Split-Path -Path (Split-Path -Path $pwd -Parent) -Leaf
        $CurrentFolder = Split-Path -Path $pwd -Leaf
        "$ParentFolder\$CurrentFolder"
    } elseif ($Pwds.Count -eq 2) {
        Split-Path -Path $pwd -Leaf
    } else { ""  }

    Write-Host -Object "$Drive`:\$PwdPath" -NoNewline -ForegroundColor Magenta

    ## User
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    if ($IsAdmin) {
        Write-Host -Object ">" -NoNewline -ForegroundColor Red
    } else {
        Write-Host -Object ">" -NoNewline -ForegroundColor Green
    }
    return " "
}

function git_status { git status --short }
function git_log { git log --graph --abbrev-commit --date-order --format=format:'%Cblue%h%Creset%C(bold red)%d%Creset %s <%an> %Cgreen(%ar)%Creset' --all }

Set-Alias -Name vi -Value nvim
Set-Alias -Name gs -Value git_status
Set-Alias -Name gl -Value git_log -Force

cd ~
