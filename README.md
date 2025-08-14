# AppleMagicSwitcher

Toggle Bluetooth connection of Apple Magic devices with a single command

## Description
AppleMagicSwitcher is a simple shell script that allows you to easily toggle the connection to your Apple Magic devices (keyboard, mouse, trackpad) via Bluetooth on macOS.
Normally an Apple Magic device can only be connected to one Mac device. You would need to connect the lightning cable to pair your Magic device to another Mac.
This script works like a toggle. If the Magic device is connected, it will disconnect and the other way around.
You need to add and configure this script on all your Mac devices.

## Installation
1. Download the shell script [apple-magic-switcher.sh](https://github.com/JurgenKonniger/AppleMagicSwitcher/blob/main/apple-magic-switcher.sh) or clone this repository:
```bash
git clone https://github.com/JurgenKonniger/AppleMagicSwitcher.git
cd AppleMagicSwitcher
```

2. Make the script executable:
```bash
chmod +x apple-magic-switcher.sh
```

3. Install blueutil (required dependency):
I recommend homebrew for the installation:
```bash
brew install blueutil
```

## Usage
1. Find the MAC address of your device:
Enter this command in the Terminal: `system_profiler SPBluetoothDataType`.


2. Configure the script:
```bash
nano apple-magic-switcher.sh
```
Replace `replace-with-your-mac-address` with your Apple Magic device's MAC address.

Verify also the location of blueutil and adjust this if necessary.


3. Run the script:
```bash
./apple-magic-switcher.sh
```

## Add Quick Action to the menu bar with Automator (optional)
1. Open Automator from your Applications folder.
2. Go to "File > New" and select "Quick Action".
3. At the top of the workflow window, configure the following:
   * Workflow receives current: no input
   * in: any application
   * In the actions library on the left, search for "Run Shell Script" and drag it into the main workflow area.
   * In the "Run Shell Script" action, enter the location of your shell script. For instance:
```bash
/Users/yourhome/bin/apple-magic-switcher.sh
```

4. Save the Quick Action with a descriptive name, like "Apple Magic Switcher"
5. You can now access your script from the menu bar by clicking on the application's name (e.g., Finder in the top-left) and then navigating to "Services > Apple Magic Switcher". 

## Add a keyboard shortcut (optional)
After saving the Quick Action, you can assign a keyboard shortcut. 
1. Go to "System Settings" (or "System Preferences") and click on "Keyboard".
2. Select "Keyboard Shortcuts..."
3. In the sidebar, click on "Services".
4. Go to "General" and there you should see the Quick Action you just created "Apple Magic Switcher.
5. Doubleclick on the right side of the Quick Action to give it a keyboard shortcut. 

## Requirements
- macOS
- [blueutil](https://github.com/toy/blueutil/)
- [homebrew](https://brew.sh/) (for installing blueutil) 

## Motivation
I was looking for a simple way to switch my Magic keyboard to different MacBook without using a lightning cable.
There a several ways to archive this. There are paid apps and also open source solutions. My preference was using an opensource solution which is well-maintained. 
That made me choose for something based on blueutil. 
I stumbled on MonkeySwitcher which is an app. This app has blueutil embedded. But I wanted a solution that makes use of the most recent version of blueutil.
So I ended up using the shell script of MonkeySwitcher and instead of an app I added a Quick Action with a keyboard shortcut.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- Based on [MonkeySwitcher](https://github.com/gyptazy/MonkeySwitcher) by Florian Paul Azim Hoberg
- Uses [blueutil](https://github.com/toy/blueutil/) for Bluetooth operations
