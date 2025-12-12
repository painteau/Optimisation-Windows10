##########
# Windows 10 Settings Restore Script
# Author: Enhanced version for Win10-Initial-Setup-Script
# Description: Restores settings from a backup created by Backup-Settings.ps1
##########

# Relaunch with administrator privileges if needed
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Write-Host "Requesting administrator privileges..." -ForegroundColor Yellow
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Windows 10 Settings Restore Tool" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# List available backups
$BackupRoot = "$PSScriptRoot\..\backups"
if (!(Test-Path $BackupRoot)) {
    Write-Host "No backups found!" -ForegroundColor Red
    Write-Host "Please run Backup-Settings.ps1 first to create a backup." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

$Backups = Get-ChildItem -Path $BackupRoot -Directory | Sort-Object Name -Descending

if ($Backups.Count -eq 0) {
    Write-Host "No backups found in $BackupRoot" -ForegroundColor Red
    Write-Host ""
    Write-Host "Press any key to exit..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

Write-Host "Available backups:" -ForegroundColor Yellow
Write-Host ""

for ($i = 0; $i -lt $Backups.Count; $i++) {
    $BackupInfo = "$($BackupRoot)\$($Backups[$i].Name)\SystemInfo.json"
    if (Test-Path $BackupInfo) {
        $Info = Get-Content $BackupInfo | ConvertFrom-Json
        Write-Host "[$($i + 1)] $($Backups[$i].Name)" -ForegroundColor White
        Write-Host "    Date: $($Info.BackupDate)" -ForegroundColor Gray
        Write-Host "    OS: $($Info.OS) (Build $($Info.Build))" -ForegroundColor Gray
        Write-Host ""
    } else {
        Write-Host "[$($i + 1)] $($Backups[$i].Name)" -ForegroundColor White
        Write-Host ""
    }
}

# Select backup
Write-Host "Select backup to restore (1-$($Backups.Count)) or 0 to cancel: " -ForegroundColor Yellow -NoNewline
$Selection = Read-Host

if ($Selection -eq "0" -or $Selection -eq "") {
    Write-Host "Restore cancelled." -ForegroundColor Yellow
    Exit
}

$SelectedIndex = [int]$Selection - 1
if ($SelectedIndex -lt 0 -or $SelectedIndex -ge $Backups.Count) {
    Write-Host "Invalid selection!" -ForegroundColor Red
    Exit
}

$SelectedBackup = $Backups[$SelectedIndex]
$BackupPath = "$BackupRoot\$($SelectedBackup.Name)"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Restoring: $($SelectedBackup.Name)" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Warning
Write-Host "WARNING: This will restore registry settings from the backup." -ForegroundColor Red
Write-Host "Current settings will be overwritten!" -ForegroundColor Red
Write-Host ""
Write-Host "It's recommended to create a new backup before restoring." -ForegroundColor Yellow
Write-Host ""
Write-Host "Do you want to continue? (Y/N): " -ForegroundColor Yellow -NoNewline
$Confirm = Read-Host

if ($Confirm -ne "Y" -and $Confirm -ne "y") {
    Write-Host "Restore cancelled." -ForegroundColor Yellow
    Exit
}

# Create a quick backup before restore
Write-Host ""
Write-Host "[1/3] Creating safety backup before restore..." -ForegroundColor Yellow
try {
    $SafetyBackupDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    Checkpoint-Computer -Description "BeforeRestore_$SafetyBackupDate" -RestorePointType "MODIFY_SETTINGS"
    Write-Host "      Safety restore point created!" -ForegroundColor Green
} catch {
    Write-Host "      Warning: Could not create restore point" -ForegroundColor Red
}

# Restore registry keys
Write-Host "[2/3] Restoring registry keys..." -ForegroundColor Yellow
$RegFiles = Get-ChildItem -Path $BackupPath -Filter "*.reg"
$ImportedCount = 0

foreach ($RegFile in $RegFiles) {
    try {
        reg import $RegFile.FullName 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            $ImportedCount++
        }
    } catch {
        Write-Host "      Warning: Could not import $($RegFile.Name)" -ForegroundColor Yellow
    }
}
Write-Host "      Imported $ImportedCount registry files" -ForegroundColor Green

# Display restored apps info
Write-Host "[3/3] Checking restored settings..." -ForegroundColor Yellow
if (Test-Path "$BackupPath\InstalledApps.csv") {
    $BackupApps = Import-Csv "$BackupPath\InstalledApps.csv"
    Write-Host "      Backup contained $($BackupApps.Count) installed apps" -ForegroundColor Green
    Write-Host "      (App restoration requires manual reinstallation)" -ForegroundColor Gray
}

if (Test-Path "$BackupPath\ServicesStatus.csv") {
    Write-Host "      Services status information available in backup" -ForegroundColor Green
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Restore completed!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Important notes:" -ForegroundColor Yellow
Write-Host "1. Some settings require a system restart to take effect" -ForegroundColor White
Write-Host "2. Applications must be reinstalled manually if needed" -ForegroundColor White
Write-Host "3. Check ServicesStatus.csv for services that need to be reconfigured" -ForegroundColor White
Write-Host ""
Write-Host "Would you like to restart now? (Y/N): " -ForegroundColor Yellow -NoNewline
$RestartConfirm = Read-Host

if ($RestartConfirm -eq "Y" -or $RestartConfirm -eq "y") {
    Write-Host ""
    Write-Host "Restarting in 10 seconds..." -ForegroundColor Yellow
    Write-Host "Press Ctrl+C to cancel" -ForegroundColor Gray
    Start-Sleep -Seconds 10
    Restart-Computer -Force
} else {
    Write-Host ""
    Write-Host "Please restart your computer manually for changes to take effect." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
