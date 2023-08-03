My Digital Environment
======================
Personal digital stuff I need to feel cozy on my Android/Linux/Windows boxes.

⚠️ Requirements
----------------
1. On Windows it requires the installation of *Git for Windows*.
2. Download and extract or 'git clone' this repository into the home folder.

💻 Desktop Setup
------------------
1. Set a desktop wallpaper: Open *Windows Settings* > *Personalisation* and set the image in the *pictures* folder.
2. Set a lock screen: Open *Windows Settings* > *Personalisation* and set the image in the *pictures* folder.
3. Install fonts for coding: Open the *File Explorer*, go to the fonts/Fira_Code_v6.2/ttf folder, select all, and install the fonts.
4. Configure to use those fonts in *Windows Terminal*.
5. Configure to use those fonts in *Visual Studio Code*.
6. Configure to use those fonts in *Visual Studio 2017*.

⚜️ Folder Icons
----------------
1. Open the *File Explorer* and go to the *my-env/folder icons/* folder.
2. Activate the 'Large Icon' view and select the appropriate icon.
3. Copy that icon file into your folder and rename it to 'folder.jpg'.

🔧 Terminal Setup
------------------
In a terminal window execute the following: (copy&paste recommended)
```
cd ~
git clone https://github.com/fleschutz/my-env
cd my-env
cp powershell-profile.ps1 $PROFILE           (when in a PowerShell session)

./install-windows-apps.ps1        (on Windows)

sudo apt install ... (on Linux)

sudo snap install ant audacity bashtop chromium cmake emacs ffmpeg firefox gimp go groovy htop hw-probe nano python38    (when using Linux & Snaps)
```
