sudo cp *.sh /opt 
sudo cp -R bloodhound/ /opt 
sudo cp -R htb/ /opt 
sudo cp -R icons/ /opt 
sudo cp banner /opt

mkdir ~/.config/powershell/
cp ~/gitclones/pwnbox/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

sudo cp ~/gitclones/pwnbox/htb.jpg /usr/share/backgrounds/
sudo cp -R ~/gitclones/pwnbox/Material-Black-Lime-Numix-FLAT/ /usr/share/icons/
sudo cp -R ~/gitclones/pwnbox/htb /usr/share/icons/
sudo mkdir /usr/share/themes/HackTheBox && sudo cp ~/gitclones/pwnbox/index.theme /usr/share/themes/HackTheBox

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

cp ~/.bashrc ~/.bashrc.bak
cp .config/.bashrc ~/.bashrc
source ~/.bashrc
