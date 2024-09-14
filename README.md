My Settings
===========
My personal settings to feel cozy on any Android/Linux/Windows.

🔧 Install this Repo
---------------------
* Git available? If yes, execute in a terminal window: `cd ~; git clone https://github.com/fleschutz/my-settings`
* Otherwise, download and extract this repository into the home folder (see green button above).

💻 Configure Wallpaper & Lockscreen
------------------------------------
1. Set a desktop wallpaper: Open *Windows Settings* > *Personalisation* and choose an image in the *desktop wallpapers* subfolder.
2. Set a desktop lockscreen: Open *Windows Settings* > *Personalisation* and choose an image in the *desktop lockscreens* subfolder.

💻 Install Basic Applications
------------------------------
1. Windows: Uninstall bloatware by executing: `./uninstall-bloatware.ps1`
2. Windows: Install basic applications by executing: `./install-basic-apps.ps1`
3. Linux: Install basic packages by executing: `sudo apt install ...`
4. Linux: Install basic snaps by executing: `snap install ant audacity bashtop chromium cmake emacs ffmpeg firefox gimp go groovy htop hw-probe nano python38`

⚜️ Folder Icons
----------------
1. Open the *File Explorer* and go to the *folder icons* subfolder.
2. Activate the 'Large Icon' view and select the appropriate icon.
3. Copy that icon file into your folder and rename it to 'folder.jpg'.

💻 Fonts
---------
1. Install system-wide fonts for coding: Open the *File Explorer*, go to the *fonts/Fira_Code_v6.2/ttf* subfolder, select all, and install the fonts.
2. Configure *Windows Terminal* to use those fonts.
3. Configure *Visual Studio Code* to use those fonts.
4. Configure *Visual Studio 2017* to use those fonts.

🔧 Terminal Setup
------------------
In a terminal window execute the following: (copy&paste recommended)
```
cd ~
git clone https://github.com/fleschutz/my-settings
cd my-settings
cp powershell-profile.ps1 $PROFILE           (when in a PowerShell session)
```

📧 Feedback
------------
Send your email feedback to: markus.fleschutz [at] gmail.com

🤝 License & Copyright
-----------------------
This open source project is licensed under the CC0 license. All trademarks are the property of their respective owners.
