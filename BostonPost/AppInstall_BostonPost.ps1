
$PackageName = "AppInstall_BostonPost"
$Version = "1"       
        
# Define arguments for .EXE installer
$Arguments = @(
"/S"
"/V/qn"
)

# Define the directory
$directoryName = "FDS\Temp"
$directoryPath = Join-Path -Path $env:ProgramData -ChildPath $directoryName
$filesPath = Join-Path -Path $directoryPath -ChildPath "Files"
$zipPath = Join-Path -Path $filesPath -ChildPath "Boston Post Installer.zip.001"

# Define the GitHub URLs for the files
$bpFiles1 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.001"
$bpFiles2 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.002"
$bpFiles3 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.003"
$bpFiles4 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.004"
$bpFiles5 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.005"
$bpFiles6 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.006"
$bpFiles7 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.007"
$bpFiles8 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.008"
$bpFiles9 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.009"
$bpFiles10 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.010"
$bpFiles11 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.011"
$bpFiles12 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.012"
$bpFiles13 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.013"
$bpFiles14 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.014"
$bpFiles15 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.015"
$bpFiles16 = "https://github.com/ChrisFDSTech/Remnant/blob/main/BostonPost/Files/BostonPostInstaller.zip.016"

# Start logging if any part of the process fails
$logPath = "C:\FDSLogs"
if (-not (Test-Path $logPath)) {
    try {
        New-Item -ItemType Directory -Path $logPath -Force | Out-Null
    }
    catch {
        Write-Host "Failed to create directory: $logPath"
        Start-Transcript -Path (Join-Path -Path $env:ProgramData -ChildPath "$($PackageName)_$(Get-Date -Format 'MM-dd-yyyy_HH:mm:ss').txt") -Append
    }
}
else {
    Start-Transcript -Path (Join-Path -Path $logPath -ChildPath "$($PackageName)_$(Get-Date -Format 'MM-dd-yyyy_HH:mm:ss').txt") -Append
}

# Create the directory
if (-not (Test-Path $directoryPath)) {
    try {
        Write-Host "Creating directory: $directoryPath"
        New-Item -ItemType Directory -Path $directoryPath -Force | Out-Null
    }
    catch {
        Write-Warning "Failed to create directory: $directoryPath"
    }
}


# Download Zip files from GitHub to the FDS Directory
Write-Host "Downloading icon files from: GitHub
try {
        Invoke-WebRequest -Uri $bpFiles1 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles2 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles3 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles4 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles5 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles6 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles7 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles8 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles9 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles10 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles11 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles12 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles13 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles14 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles15 -OutFile $filesPath
        Invoke-WebRequest -Uri $bpFiles16 -OutFile $filesPath
}
catch {
    Write-Warning "Failed to download zipped files from: GitHub"
}

# Exract contents of zip file
Expand-Archive -Path $zipPath -DestinationPath $filesPath -Force

#Installation
Start-Process -FilePath "$filesPath\pm_9.2.49_full.exe" -ArgumentList $Arguments -Wait
Start-Process -Filepath "$filesPath\pm_9.2.49_full.msi" /passive
