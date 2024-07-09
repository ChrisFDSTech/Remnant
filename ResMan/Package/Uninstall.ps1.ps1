
$PackageName = "uninstallDesktopIcon_ResMan"
$Version = "1"

# Define the directory
$directoryName = "FDS\Icons"
$directoryPath = Join-Path -Path $env:ProgramData -ChildPath $directoryName

# Define the Shortcut Info
$ShortcutName = "ResMan.lnk"
$ShortcutPath = Join-Path -Path ([Environment]::GetFolderPath("CommonDesktopDirectory")) -ChildPath $ShortcutName

# Remove the desktop shortcut
try {
    Remove-Item -Path $ShortcutPath -Force
    Write-Host "Desktop shortcut removed: $ShortcutPath"
}
catch {
    Write-Warning "Failed to remove desktop shortcut: $ShortcutPath"
    Write-Warning $_.Exception.Message
}

# Remove the icon file
$iconPath = Join-Path -Path $directoryPath -ChildPath "ResMan.ico"
try {
    Remove-Item -Path $iconPath -Force
    Write-Host "Icon file removed: $iconPath"
}
catch {
    Write-Warning "Failed to remove icon file: $iconPath"
    Write-Warning $_.Exception.Message
}

# Remove the FDS\Icons directory if it's empty
try {
    if ((Get-ChildItem -Path $directoryPath -Force).Count -eq 0) {
        Remove-Item -Path $directoryPath -Recurse -Force
        Write-Host "Directory removed: $directoryPath"
    }
}
catch {
    Write-Warning "Failed to remove directory: $directoryPath"
    Write-Warning $_.Exception.Message
}
