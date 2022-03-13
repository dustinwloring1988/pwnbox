# Copy folders were they are needed
sudo cp -R HTB/ /opt    # all scripts for the banners and panels
sudo cp -R htb/ /opt 
sudo cp -R icons/ /opt 

# Add a custom ps1 profile
mkdir ~/.config/powershell/
cp ~/gitclones/pwnbox/configs/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# Move background to a useable folder
sudo cp ~/gitclones/pwnbox/backgrounds/htb.jpg /usr/share/backgrounds/

# Move Black-Lime Flat Icons to a useable folder
sudo cp -R ~/gitclones/pwnbox/Material-Black-Lime-Numix-FLAT/ /usr/share/icons/

# Move HTB Icons to a useable folder
sudo cp -R ~/gitclones/pwnbox/htb /usr/share/icons/

# Make a theme folder for our theme and copy the theme over
sudo mkdir /usr/share/themes/HackTheBox 
sudo cp ~/gitclones/pwnbox/themes/htb/index.theme /usr/share/themes/HackTheBox

# Download and install sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# Backup the bashrc file
cp ~/.bashrc ~/.bashrc.bak

# Replace the exisiting bashrc file with ours and refresh
sudo cp ~/gitclones/pwnbox/configs/.bashrc ~/.bashrc
source ~/.bashrc
