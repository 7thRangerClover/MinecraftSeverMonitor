# Path to your Minecraft server start script
$serverPath = ".\start.ps1"  # Since the monitor script is in the same directory as the server

# Process name for your Minecraft server
$serverProcessName = "java.exe"

# Function to check if the server process is running
function Test-ServerRunning {
    try {
        # Get the process by name and filter by command line or user name
        $process = Get-WmiObject Win32_Process -Filter "Name = '$serverProcessName'" | Where-Object {
            $_.CommandLine -like '*minecraft*' -and $_.GetOwner().User -eq 'jacob'
        }

        if ($process) {
            return $true
        } else {
            Write-Host "Minecraft server process not found." -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "Error: Unable to retrieve process information." -ForegroundColor Red
        return $false
    }
}

# Function to start the server
function Start-Server {
    if (Test-Path $serverPath) {
        Write-Host "Starting Minecraft server..." -ForegroundColor Green

        # Use Start-Process to run the PowerShell script
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$serverPath`""

        # Wait a bit to allow the server to start
        Start-Sleep -Seconds 10
    } else {
        Write-Host "Error: Server start script '$serverPath' not found." -ForegroundColor Red
    }
}

# Function to write a timestamped message
function Write-Log {
    param (
        [string]$message,
        [ConsoleColor]$color = "White"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] $message" -ForegroundColor $color
}

# Main loop to monitor the server
try {
    while ($true) {
        # Check if the server process is running
        $isRunning = Test-ServerRunning

        if (-not $isRunning) {
            Write-Log "Minecraft server is down. Restarting in 15 seconds..." -color "Yellow"
            Start-Sleep -Seconds 15

            # Restart the server
            Start-Server
        } else {
            Write-Log "Minecraft server is running." -color "Cyan"
        }

        # Wait 120 seconds before the next check
        Start-Sleep -Seconds 120
    }
} catch {
    Write-Host "An unexpected error occurred: $_" -ForegroundColor Red
}

# Keep the console open after the script ends
Write-Host "Press any key to exit..." -ForegroundColor White
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
