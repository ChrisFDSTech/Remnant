

$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/ChrisFDSTech/Remnant/main/ResMan/DesktopIcon_ResMan -UseBasicParsing

if ($ScriptFromGitHub.StatusCode -eq 200) {
    # Successfully retrieved script content
    $ScriptContent = $ScriptFromGitHub.Content
    Invoke-Expression $ScriptContent
 } else {
    Write-Host "Failed to download the script. Status code: $($ScriptFromGitHub.StatusCode)"
}
