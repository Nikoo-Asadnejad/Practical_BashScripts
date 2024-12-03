# Variables
$LocalPath = "."
$ZipFileName = "publish.zip"
$ServerUser = "your_username"
$ServerAddress = "your_server_address"
$RemotePort = 22
$RemotePath = "/path/on/server"
$AppPoolName = "YourAppPoolName"
$SSHKeyPath = "~/.ssh/id_rsa" # Path to your private key for SSH


Write-Host "Creating ZIP file..."
$ExcludePatterns = @("appsettings.*.json", "web.config")
Get-ChildItem -Path $LocalPath -Recurse | Where-Object {
    $_.FullName -notmatch "appsettings\..*\.json" -and $_.FullName -notmatch "web\.config"
} | Compress-Archive -DestinationPath $ZipFileName -Force

if (-Not (Test-Path $ZipFileName)) {
    Write-Error "Failed to create ZIP file."
    exit 1
}

Write-Host "ZIP file created: $ZipFileName"

# Copy the ZIP file to the remote server using SCP
Write-Host "Copying ZIP file to remote server..."
scp -P $RemotePort -i $SSHKeyPath $ZipFileName "$ServerUser@$ServerAddress:$RemotePath"

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to copy ZIP file to remote server."
    exit 1
}

Write-Host "ZIP file copied successfully."

Write-Host "Executing remote commands on server..."
$RemoteCommands = @"
    echo "Stopping IIS application pool: $AppPoolName"
    powershell -Command "Import-Module WebAdministration; Stop-WebAppPool -Name '$AppPoolName'"
    echo "Unzipping the file..."
    cd $RemotePath && unzip -o $ZipFileName
    echo "Starting IIS application pool: $AppPoolName"
    powershell -Command "Import-Module WebAdministration; Start-WebAppPool -Name '$AppPoolName'"
    echo "Deployment completed successfully."
"@

ssh -p $RemotePort -i $SSHKeyPath "$ServerUser@$ServerAddress" $RemoteCommands

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed during remote operations on the server."
    exit 1
}

Write-Host "Deployment completed successfully!"
