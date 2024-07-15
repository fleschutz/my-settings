My Settings
===========
Personal settings I need to feel cozy on my Android/Linux/Windows boxes.

🔧 Installation
----------------
* With Git installed: `git clone https://github.com/fleschutz/my-settings` this repository into the home folder.
* Otherwise: download and extract this repository into the home folder.

💻 Pictures
------------
1. Set a desktop wallpaper: Open *Windows Settings* > *Personalisation* and set the image in the *pictures/* subfolder.
2. Set a lock screen: Open *Windows Settings* > *Personalisation* and set the image in the *pictures/* subfolder.

⚜️ Folder Icons
----------------
1. Open the *File Explorer* and go to the *folder icons/* subfolder.
2. Activate the 'Large Icon' view and select the appropriate icon.
3. Copy that icon file into your folder and rename it to 'folder.jpg'.

💻 Fonts
---------
1. Install fonts for coding: Open the *File Explorer*, go to the *fonts/Fira_Code_v6.2/ttf* subfolder, select all, and install the fonts.
2. Configure to use those fonts in *Windows Terminal*.
3. Configure to use those fonts in *Visual Studio Code*.
4. Configure to use those fonts in *Visual Studio 2017*.

🔧 Terminal Setup
------------------
In a terminal window execute the following: (copy&paste recommended)
```
cd ~
git clone https://github.com/fleschutz/my-settings
cd my-settings
cp powershell-profile.ps1 $PROFILE           (when in a PowerShell session)

./install-windows-apps.ps1        (on Windows)

sudo apt install ... (on Linux)

sudo snap install ant audacity bashtop chromium cmake emacs ffmpeg firefox gimp go groovy htop hw-probe nano python38    (when using Linux & Snaps)
```

📧 Feedback
------------
Send your email feedback to: markus.fleschutz [at] gmail.com

🤝 License & Copyright
-----------------------
This open source project is licensed under the CC0 license. All trademarks are the property of their respective owners.
