# Chocolatey Menu Script
# Run PowerShell as Administrator

# ----------------------------
# Define App Groups
# ----------------------------

$generalApps = @(
    "googlechrome",
    "7zip",
    "vlc",
    "notepadplusplus",
    "putty"
)

$devApps = @(
    "git",
    "vscode",
    "nodejs",
    "python",
    "openjdk"
)

$allApps = $generalApps + $devApps

# ----------------------------
# Functions
# ----------------------------

function Install-Choco {
    if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Chocolatey..." -ForegroundColor Cyan
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    } else {
        Write-Host "Chocolatey is already installed." -ForegroundColor Green
    }
}

function Add-NexusRepo {
    param(
        [string]$RepoUrl = "http://nexus.rcoe.co.in/repository/choco/"
    )

    Write-Host "`nRemoving existing sources..." -ForegroundColor Cyan
    choco source remove -n=nexus -ErrorAction SilentlyContinue
    choco source disable -n=chocolatey -ErrorAction SilentlyContinue

    Write-Host "Adding Nexus repo to Chocolatey: $RepoUrl" -ForegroundColor Cyan
    choco source add -n=nexus -s=$RepoUrl --priority=1

    Write-Host "`n✔ Nexus repo added to Chocolatey." -ForegroundColor Green
}

function Install-SelectedApps {
    $apps = @()
    do {
        Clear-Host
        Write-Host "=== Select Apps to Install ===" -ForegroundColor Yellow
        for ($i = 0; $i -lt $allApps.Count; $i++) {
            Write-Host "$($i+1). $($allApps[$i])"
        }
        Write-Host "I. Install selected apps"
        Write-Host "Q. Back to main menu"
        $choice = Read-Host "Choose option"

        switch ($choice.ToUpper()) {
            {$_ -match '^\d+$'} {
                $index = [int]$choice - 1
                if ($index -ge 0 -and $index -lt $allApps.Count) {
                    $app = $allApps[$index]
                    if ($apps -contains $app) {
                        $apps = $apps | Where-Object {$_ -ne $app}
                        Write-Host "$app deselected"
                    } else {
                        $apps += $app
                        Write-Host "$app selected"
                    }
                }
                Pause
            }
            "I" {
                if ($apps.Count -gt 0) {
                    Write-Host "Installing selected apps: $($apps -join ', ')" -ForegroundColor Cyan
                    choco install $apps -y
                } else {
                    Write-Host "No apps selected!" -ForegroundColor Red
                }
                Pause
            }
            "Q" { return }
        }
    } while ($true)
}

function Install-GeneralApps {
    Write-Host "Installing general apps: $($generalApps -join ', ')" -ForegroundColor Cyan
    choco install $generalApps -y
}

function Install-DevApps {
    Write-Host "Installing dev apps: $($devApps -join ', ')" -ForegroundColor Cyan
    choco install $devApps -y
}

# ----------------------------
# Main Menu
# ----------------------------

do {
    Clear-Host
    Write-Host "==== Chocolatey Menu ====" -ForegroundColor Green
    Write-Host "1. Install Chocolatey"
    Write-Host "2. Add local Nexus repo to Chocolatey"
    Write-Host "3. Select and Install Apps"
    Write-Host "4. Install all General Purpose Apps"
    Write-Host "5. Install all Dev Apps"
    Write-Host "6. Exit"
    $option = Read-Host "Enter choice"

    switch ($option) {
        "1" { Install-Choco; Pause }
        "2" { Add-NexusRepo; Pause }
        "3" { Install-SelectedApps }
        "4" { Install-GeneralApps; Pause }
        "5" { Install-DevApps; Pause }
        "6" { break }
        default { Write-Host "Invalid option!" -ForegroundColor Red; Pause }
    }
} while ($true)
