
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

# Define the GitHub URLs for the files



Invoke-WebRequest -Uri "https://update.bostonpost.com/pm/9.2.49/pm_9.2.49_full.exe" -OutFile "C:\Users\Public\Downloads\pm_9.2.49_full.exe"
Invoke-WebRequest -Uri "https://update.bostonpost.com/pm/9.2.49/pm_9.2.49_full.msi" -OutFile "C:\Users\Public\Downloads\pm_9.2.49_full.msi"

Start-Process -FilePath "C:\Users\Public\Downloads\\pm_9.2.49_full.exe" -ArgumentList $Arguments -Wait
Start-Process -Filepath "C:\Users\Public\Downloads\pm_9.2.49_full.msi" /passive