# computer-dsc

Windows configuration files using DSC (Desired State Configuration).

## Configuration Files

- **ui-theme.dsc.yaml** - Dark mode settings
- **taskbar.dsc.yaml** - Taskbar configuration and icon size
- **start-menu.dsc.yaml** - Start menu settings
- **desktop.dsc.yaml** - Desktop icon settings, spacing, and layout
- **explorer.dsc.yaml** - Windows Explorer settings
- **software.dsc.yaml** - Software installation via WinGet

## Usage

Open PowerShell as Administrator and run:

### Quick Setup (Recommended)
```powershell
# From GitHub
irm https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/apply-config.ps1 | iex

# Or download and run locally
.\apply-config.ps1 -Local

# Skip software installation
.\apply-config.ps1 -SkipSoftware
```

### Individual configurations
```powershell
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/ui-theme.dsc.yaml --accept-configuration-agreements
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/taskbar.dsc.yaml --accept-configuration-agreements
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/start-menu.dsc.yaml --accept-configuration-agreements
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/desktop.dsc.yaml --accept-configuration-agreements
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/explorer.dsc.yaml --accept-configuration-agreements
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/software.dsc.yaml --accept-configuration-agreements
```

### Legacy (all-in-one)
```powershell
winget configure --file https://raw.githubusercontent.com/kmj251/computer-dsc/refs/heads/main/configuration.dsc.yaml --accept-configuration-agreements
```
