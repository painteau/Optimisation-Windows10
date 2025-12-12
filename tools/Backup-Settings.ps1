##########
# Windows 10 Settings Backup Script
# Author: Enhanced version for Win10-Initial-Setup-Script
# Description: Creates a backup of critical registry keys and system settings
##########

# Relaunch with administrator privileges if needed
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Write-Host "Requesting administrator privileges..." -ForegroundColor Yellow
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Create backup directory
$BackupDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$BackupDir = "$PSScriptRoot\..\backups\Backup_$BackupDate"
New-Item -Path $BackupDir -ItemType Directory -Force | Out-Null

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Windows 10 Settings Backup Tool" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backup location: $BackupDir" -ForegroundColor Green
Write-Host ""

# Create system restore point
Write-Host "[1/5] Creating system restore point..." -ForegroundColor Yellow
try {
    Enable-ComputerRestore -Drive "$env:SystemDrive\"
    Checkpoint-Computer -Description "Win10Script_Backup_$BackupDate" -RestorePointType "MODIFY_SETTINGS"
    Write-Host "      System restore point created successfully!" -ForegroundColor Green
} catch {
    Write-Host "      Warning: Could not create restore point: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "      Continuing with registry backup..." -ForegroundColor Yellow
}

# Export critical registry keys
Write-Host "[2/5] Backing up registry keys..." -ForegroundColor Yellow

$RegistryPaths = @(
    # Privacy and Telemetry
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
    "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection",

    # Windows Defender
    "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender",
    "HKLM\SOFTWARE\Microsoft\Windows Defender",

    # Windows Update
    "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate",

    # Explorer settings
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",

    # Privacy settings
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy",

    # Network settings
    "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters",

    # UI settings
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
)

$ExportedCount = 0
foreach ($RegPath in $RegistryPaths) {
    $FileName = $RegPath -replace '\\', '_'
    $ExportPath = "$BackupDir\$FileName.reg"

    try {
        reg export $RegPath $ExportPath /y 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            $ExportedCount++
        }
    } catch {
        # Silent error - some keys may not exist
    }
}
Write-Host "      Exported $ExportedCount registry keys" -ForegroundColor Green

# Backup installed applications list
Write-Host "[3/5] Backing up installed applications list..." -ForegroundColor Yellow
Get-AppxPackage | Select-Object Name, PackageFullName, Version |
    Export-Csv -Path "$BackupDir\InstalledApps.csv" -NoTypeInformation
Write-Host "      Applications list saved" -ForegroundColor Green

# Backup services status
Write-Host "[4/5] Backing up services status..." -ForegroundColor Yellow
Get-Service | Select-Object Name, DisplayName, Status, StartType |
    Export-Csv -Path "$BackupDir\ServicesStatus.csv" -NoTypeInformation
Write-Host "      Services status saved" -ForegroundColor Green

# Create system information file
Write-Host "[5/5] Creating system information file..." -ForegroundColor Yellow
$SystemInfo = @{
    'ComputerName' = $env:COMPUTERNAME
    'UserName' = $env:USERNAME
    'OS' = (Get-WmiObject Win32_OperatingSystem).Caption
    'Version' = (Get-WmiObject Win32_OperatingSystem).Version
    'Build' = (Get-WmiObject Win32_OperatingSystem).BuildNumber
    'Architecture' = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
    'BackupDate' = $BackupDate
}
$SystemInfo | ConvertTo-Json | Out-File "$BackupDir\SystemInfo.json"
Write-Host "      System information saved" -ForegroundColor Green

# Create README for the backup
$ReadmeContent = @"
# Windows 10 Settings Backup
Created: $BackupDate

## System Information
- Computer: $($SystemInfo.ComputerName)
- User: $($SystemInfo.UserName)
- OS: $($SystemInfo.OS)
- Version: $($SystemInfo.Version)
- Build: $($SystemInfo.Build)

## Backup Contents
- Registry keys (*.reg files)
- Installed applications list (InstalledApps.csv)
- Services status (ServicesStatus.csv)
- System information (SystemInfo.json)
- System restore point: Win10Script_Backup_$BackupDate

## How to Restore

### Option 1: System Restore Point (Recommended)
1. Open System Properties (sysdm.cpl)
2. Go to System Protection tab
3. Click "System Restore"
4. Select "Win10Script_Backup_$BackupDate"
5. Follow the wizard

### Option 2: Manual Registry Restore
1. Double-click the .reg files you want to restore
2. Confirm the import
3. Restart your computer

### Option 3: Full Restore Script
Run the Restore-Settings.ps1 script from the tools folder
and select this backup folder.

## Warning
- Always create a new backup before restoring
- Test in a safe environment first
- Some settings may require a restart to take effect
"@

$ReadmeContent | Out-File "$BackupDir\README.txt"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Backup completed successfully!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backup saved to:" -ForegroundColor Yellow
Write-Host "$BackupDir" -ForegroundColor White
Write-Host ""
Write-Host "To restore this backup, use the Restore-Settings.ps1 script." -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
