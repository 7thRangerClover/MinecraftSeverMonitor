# Minecraft Server Monitor Script

This PowerShell script, `MinecraftServerMonitor.ps1`, is designed to monitor and manage the status of a Minecraft server running on your machine. It checks if the server process is running and restarts it automatically if it detects that the server is down.

## Features

- **Automated Monitoring**: Continuously checks the server status every 120 seconds.
- **Auto-Restart**: Automatically restarts the Minecraft server if it's detected to be down.
- **Logging**: Provides timestamped logs to the console for monitoring server status and actions taken.

## Prerequisites

- **PowerShell**: This script is designed to run in a PowerShell environment.
- **Minecraft Server**: The script is configured to monitor a Minecraft server process (typically `java.exe`).

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/minecraft-server-monitor.git


# How to Set Up Auto-Login on Windows Using the Registry Editor

## Step 1: Open the Registry Editor
1. Press `Win + R` to open the Run dialog.
2. Type `regedit` and press Enter. This will open the Registry Editor.
3. If prompted by User Account Control (UAC), click **Yes** to allow the Registry Editor to make changes.

## Step 2: Navigate to the Winlogon Key
1. In the Registry Editor, navigate to the following path:
   ```plaintext
   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
   ```
2. You can do this by expanding the folders in the left pane or by copying and pasting the path into the address bar of the Registry Editor.

## Step 3: Modify the AutoAdminLogon ValueW
1. Find the `AutoAdminLogon` value in the right pane.
2. Double-click on `AutoAdminLogon`.
3. Change the value data to `1` to enable auto-login.
4. Click **OK** to save the change.

## Step 4: Set the Default Username
1. In the same `Winlogon` key, find the `DefaultUserName` value.
2. Double-click on `DefaultUserName`.
3. Enter the username of the account you want to log in automatically in the value data field.
4. Click **OK** to save the change.

## Step 5: Set the Default Password
1. **Important:** If your account has a password, you'll need to store it in the registry, which may pose a security risk.
2. Right-click on the right pane, select **New > String Value**, and name it `DefaultPassword`.
3. Double-click on `DefaultPassword`.
4. Enter your account password in the value data field.
5. Click **OK** to save the change.

## Step 6: Set the Default Domain (Optional)
1. If your computer is part of a domain, you'll also need to set the `DefaultDomainName`.
2. Find the `DefaultDomainName` value in the right pane, or create it as a new string value if it doesn't exist.
3. Double-click on `DefaultDomainName`.
4. Enter your domain name in the value data field.
5. Click **OK** to save the change.

## Step 7: Close the Registry Editor
1. After making these changes, close the Registry Editor.
2. Restart your computer to apply the changes.

## Step 8: Testing Auto-Login
1. After the restart, your computer should automatically log in to the specified user account.
2. If it doesn't, recheck the registry entries to ensure they were entered correctly.

## Important Security Note
- Storing your password in the registry in plain text is a security risk. Ensure that your computer is in a secure environment if you decide to use auto-login.



# How to Automatically Run a PowerShell Script Using Task Scheduler

## Step 1: Open Task Scheduler
1. Press `Win + R` to open the Run dialog.
2. Type `taskschd.msc` and press Enter. This will open the Task Scheduler.

## Step 2: Create a New Task
1. In the Task Scheduler window, click on **"Create Task…"** in the right-hand Actions pane.
2. In the **"General"** tab:
   - **Name**: Give your task a name, such as `MinecraftServerMonitor`.
   - **Description**: (Optional) Add a description for the task.
   - **Security Options**: Choose "Run with highest privileges" to ensure the script runs correctly, even if it requires administrative privileges.

## Step 3: Set the Trigger
1. Go to the **"Triggers"** tab and click **"New…"** to create a trigger.
2. In the **New Trigger** window:
   - **Begin the task**: Choose **"At log on"** to run the script automatically when any user logs in.
   - **Settings**: Ensure the trigger is enabled.
   - Click **OK** to save the trigger.

## Step 4: Configure the Action
1. Go to the **"Actions"** tab and click **"New…"** to create a new action.
2. In the **New Action** window:
   - **Action**: Choose **"Start a program"**.
   - **Program/script**: Type `powershell.exe`.
   - **Add arguments**: Enter the following arguments:
     ```plaintext
     -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"C:\Users\...\MinecraftServerMonitor.ps1\"'"
     ```
   - **Start in (optional)**: Enter the directory where your script is located, e.g., `C:\Users\...\Desktop\Modded_Server`.
   - Click **OK** to save the action.

## Step 5: Finalize and Save the Task
1. Go through the **"Conditions"** and **"Settings"** tabs to adjust any other task properties as needed (optional).
2. Click **OK** to save the task.

## Step 6: Testing the Task
1. To ensure everything is set up correctly, right-click the task in Task Scheduler and select **"Run"**.
2. Check to see if the script runs as expected.
