#!/usr/bin/env pwsh
# Apply all DSC configurations

param(
    [switch]$Local,
    [switch]$SkipSoftware
)

$configs = @(
    "ui-theme.dsc.yaml",
    "taskbar.dsc.yaml",
    "start-menu.dsc.yaml",
    "desktop.dsc.yaml",
    "explorer.dsc.yaml"
)

if (-not $SkipSoftware) {
    $configs += "software.dsc.yaml"
}

$baseUrl = "https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main"

Write-Host "Starting DSC configuration..." -ForegroundColor Green

foreach ($config in $configs) {
    Write-Host "`nApplying $config..." -ForegroundColor Cyan
    
    if ($Local) {
        $filePath = Join-Path $PSScriptRoot $config
        winget configure --file $filePath --accept-configuration-agreements
    } else {
        $url = "$baseUrl/$config"
        winget configure --file $url --accept-configuration-agreements
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to apply $config" -ForegroundColor Red
    } else {
        Write-Host "Successfully applied $config" -ForegroundColor Green
    }
}

Write-Host "`nConfiguration complete!" -ForegroundColor Green
