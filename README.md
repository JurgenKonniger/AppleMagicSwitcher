# AppleMagicSwitcher

Toggle Bluetooth connection of Apple Magic devices with a single command

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Add Quick Action (optional)](#add-quick-action-to-the-menu-bar-with-automator-optional)
- [Add Keyboard Shortcut (optional)](#add-a-keyboard-shortcut-optional)
- [Requirements](#requirements)
- [Motivation](#motivation)
- [Troubleshooting](#troubleshooting)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Description
AppleMagicSwitcher is a simple shell script that allows you to easily toggle the connection to your Apple Magic devices (keyboard, mouse, trackpad) via Bluetooth on macOS.

Normally an Apple Magic device can only be connected to one Mac device. You would need to connect the lightning or USB cable to pair your Magic device to another Mac.

This script works like a toggle:
- If the Magic device is connected, it will disconnect
- If the Magic device is disconnected, it will connect

You need to add and configure this script on all Mac devices you want to use this script.

## Installation
1. **Download the shell script** [apple-magic-switcher.sh](https://github.com/JurgenKonniger/AppleMagicSwitcher/blob/main/apple-magic-switcher.sh) or clone this repository:
   ```bash
   git clone https://github.com/JurgenKonniger/AppleMagicSwitcher.git
   cd AppleMagicSwitcher
   ```

2. **Make the script executable**:
   ```bash
   chmod +x apple-magic-switcher.sh
   ```

3. **Install blueutil** (required dependency):
   I recommend Homebrew for the installation:
   ```bash
   brew install blueutil
   ```
   
   If you don't have Homebrew installed, you can get it from [brew.sh](https://brew.sh/)

## Usage
1. **Find the MAC address of your device:**
   ```bash
   system_profiler SPBluetoothDataType
   ```
   Look for your Apple Magic device in the output and note its address.

2. **Configure the script:**
   ```bash
   nano apple-magic-switcher.sh
   ```
   Replace `replace-with-your-mac-address` with your Apple Magic device's MAC address.
   
   Also verify the location of blueutil and adjust if necessary:
   ```bash
   which blueutil
   ```

3. **Run the script:**
   ```bash
   ./apple-magic-switcher.sh
   ```

## Add Quick Action to the menu bar with Automator (optional)
1. **Open Automator** from your Applications folder.
2. Go to **File > New** and select **Quick Action**.
3. At the top of the workflow window, configure the following:
   * **Workflow receives current**: no input
   * **in**: any application
   * In the actions library on the left, search for **Run Shell Script** and drag it into the main workflow area.
   * In the **Run Shell Script** action, enter the location of your shell script:
   ```bash
   /Users/yourhome/bin/apple-magic-switcher.sh
   ```
   > ⚠️ Make sure to use the full path to where you saved the script

4. **Save the Quick Action** with a descriptive name, like "Apple Magic Switcher"
5. You can now access your script from the menu bar by clicking on the application's name (e.g., Finder in the top-left) and then navigating to **Services > Apple Magic Switcher**. 

## Add a keyboard shortcut (optional)
After saving the Quick Action, you can assign a keyboard shortcut:

1. Go to **System Settings** (or "System Preferences") and click on **Keyboard**.
2. Select **Keyboard Shortcuts...**
3. In the sidebar, click on **Services**.
4. Go to **General** and find the Quick Action you created "Apple Magic Switcher".
5. Double-click on the right side of the Quick Action to give it a keyboard shortcut.
   > 💡 Tip: Consider using a shortcut that won't conflict with other applications

## Requirements
- **macOS** (10.14 or later recommended)
- [**blueutil**](https://github.com/toy/blueutil/) - Command-line Bluetooth control utility
- [**Homebrew**](https://brew.sh/) (for installing blueutil)

## Motivation
I was looking for a simple way to switch my Magic keyboard between different MacBooks without using a lightning or USB cable.
There are several ways to achieve this. There are paid apps and also open source solutions. My preference was using an open-source solution which is well-maintained. 
That made me choose something based on blueutil. 
I stumbled upon MonkeySwitcher which is an app. This app has blueutil embedded, but I wanted a solution that makes use of the most recent version of blueutil.
So I ended up using the shell script of MonkeySwitcher and modified it a little bit. Instead of an app, I added a Quick Action with a keyboard shortcut, so I can easily switch my keyboard without going to the Terminal.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Troubleshooting
If you encounter issues with the script, try these steps:

- **Turn your Magic device off and on with the toggle on the device itself.**

- **Check if blueutil is installed correctly**:
  ```bash
  which blueutil
  ```

- **Verify your device's MAC address** is correct:
  ```bash
  system_profiler SPBluetoothDataType | grep -A 20 "YourDeviceName"
  ```

- **Check Bluetooth is enabled** on your Mac:
  ```bash
  blueutil --power
  ```

- **Ensure proper permissions** for the script:
  ```bash
  chmod +x apple-magic-switcher.sh
  ```

## Acknowledgments
- Based on [MonkeySwitcher](https://github.com/gyptazy/MonkeySwitcher) by Florian Paul Azim Hoberg
- Uses [blueutil](https://github.com/toy/blueutil/) for Bluetooth operations
