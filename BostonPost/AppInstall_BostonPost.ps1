
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
$bpFiles = "https://github.com/ChrisFDSTech/Remnant/tree/main/BostonPost/Files"

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


# Download Zip file from GitHub to the FDS Directory
Write-Host "Downloading icon file from: $bpFiles"
try {
    Invoke-WebRequest -Uri $bpFiles -OutFile (Join-Path -Path $directoryPath -ChildPath "Files")
}
catch {
    Write-Warning "Failed to download icon file from: $bpFiles"
}

# Exract contents of zip file
Expand-Archive -Path $zipPath -DestinationPath $filesPath -Force

#Installation
Start-Process -FilePath "$filesPath\pm_9.2.49_full.exe" -ArgumentList $Arguments -Wait
Start-Process -Filepath "$filesPath\pm_9.2.49_full.msi" /passive
