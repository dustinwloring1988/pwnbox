# Pwnbox

![htb screenshot](htb_screenshot.png?raw=true "Pwnbox")

**For those using Kali, I added some steps at the bottom to get the new zsh terminal in 2020.3 to show your server/IP**

Want to replicate Hack the Box very own Pwnbox? Follow the guide below!
This should give you the "look and feel" of pwnbox used by Hack The Box.
Everything shown here can be done in your own Parrot OS, whether it is VM or main OS.
However, I suggest you look into what each command does, where it goes, and how you can go about customizing it to your own taste. For me, whenever I ssh into my Parrot machine, it gives me fun hackthebox logo. Go on, make it your own!

```bash

  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S

```

## Step 0: Parrot MATE

Just want to clarify that the instructions below work on Parrot Mate, available to download here: [https://download.parrot.sh/parrot/iso/4.10/Parrot-security-4.10_x64.iso](https://download.parrot.sh/parrot/iso/4.10/Parrot-security-4.10_amd64.iso)

## Step 1: Clone Repo 
In my setup below, I have created a directory called "gitclones" in my home directory.

`mkdir ~/gitclones && cd ~/gitclones`

`git clone https://github.com/dustinwloring1988/pwnbox`

## Step 2: Copy over the files

`cd ~/gitclones/pwnbox`

`sh install.sh`

We also need to add your vpn file to your /etc/openvpn location:

`sudo cp [your VPN FILE].ovpn /etc/openvpn/`

`sudo mv /etc/openvpn/[your VPN file].ovpn /etc/openvpn/[your VPN file].conf`

Make sure you rename your file to `.conf`. Then you can start your VPN like you would normally do.

> NOTE: Once you are connected to the HTB vpn, you'll see your IP and other info in your termianl. Otherwise, it'll just show your username/host and current working directory.

> NOTE 2: Pwnbox now has an **updated** terminal. This is purely by choice so if you want to use what Pwnbox has, replace the "PS1" line above that has "xterm*|rxvt*)..." with this new *PS1* output:

`\[\033[1;32m\]\342\224\200$([[ $(/opt/HTB/vpnbash.sh) == *"10."* ]] && echo "[\[\033[1;34m\]$(/opt/HTB/vpnserver.sh)\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]$(/opt/HTB/vpnbash.sh)\[\033[1;32m\]]\342\224\200")[\[\033[1;37m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\w\[\033[1;32m\]]\$\[\e[0m\]`

## Step 3: Update theme

Go to the top menu bar and choose:

System -> Preferences -> Look and Feel -> Appearance

You should now see a theme called "HackTheBox". Select it and select "Apply Background".

### At this point, you should have most of the Pwnbox 'look and feel'. However, if you want to further customize it, keep following allong.

---

## Step 4: Updating the 'Panels'

On the top panel, right click one of the three system monitors graphs (the ones showing your 'process', 'memory', and 'network'). Select "Remove from Panel".

Next, on the top panel, right click the "shell" icon (the one that looks like a bash prompt). Select "Properties".

### NOTE:You will see the "Launcher Properties" pop up. This is where you can really customize your ParrotOS. You don't need to follow what Hack the Box did. You can add ANY script you want, any command, icon, etc, to your OS! This is how you can truly personalize it.

Click on the bash icon to the left, and a window should pop up asking you to select an icon. Navigate to /usr/share/icons/htb/ and choose `bash.svg`.

### To get the 'ping panel'

Right click on a blank space on the top panel and choose "Add to Panel". In the search bar, type "command", select "command" then click "add". The current time should populate on the top panel. Right click on it, and in the command section, paste in `/opt/HTB/vpnpanel.sh`, with an interval of "5" seconds. It should show "HTB VPN: Disconnected" unless you are on the vpn.

### To get the "processor" menu

Right click on a blank space on the top panel and search for "System monitor". Select it and add it. Right click on the little black box that appeared, select "preferences" and under "System monitor width", update it to "135" pixels, and updated the field below it to "100" milliseconds.

### 'Plank', the MacOS bar on the bottom

Start by deleting the bottom panel by `right clicking` and selecting `delete this panel`.

`sudo apt install plank -y`

Once Plank is installed, on the top bar, go to "System -> Preferences -> Personal -> Startup Application". Right hand side, select "Add" and fill in the values:

- Name: Plank
- Command: plank
- Delay: 0

Plank will now startup whenever you reboot your machine.

## For Kali Users

With the new 2020.3 version of Kali, they implemented a new shell for `zsh`. I wanted to get the HTB IP and server in the terminal prompt so I made some updates.

1. Clone or copy over the `vpnpanel.sh`, `vpnbash.sh`, and `vpnpanel.sh` over to your `/opt/HTB/*` directory.
2. Update the `vpnbash.sh` script to this:

```bash
#!/bin/bash
htbip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

if [[ $htbip == *"10."* ]]
then
   echo "[%B%F{%(#.red.blue)}$(/opt/HTB/vpnserver.sh)%b%F{%(#.blue.green)}]-[%B%F{%(#.red.blue)}$htbip%b%F{%(#.blue.green)}]-"
else
   echo ""
fi

```

3. (optional) If you haven't switched your kali terminal to zsh, do that with `chsh -s /usr/bin/zsh`. Then log out, log back in. You should have a cool looking prompt

4. Update the PROMPT variable in `~/.zshrc` (using nano or your favorite editor) to `if [[ $(/opt/HTB/vpnbash.sh) == *.10.* ]]; then PROMPT="%F{red}┌[%f%F{green}%D{$(/opt/HTB/vpnserver.sh)}%f%F{red}]─[%f%F{green}%D{$(/opt/HTB/vpnbash.sh)}%f%F{red}][%B%F{%(#.red.blue)}%n%(#.💀.㉿)%m%b%F{%(#.blue.red)}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}[%f%F{yellow}★%f]%f%F{yellow}$%f" ;else PROMPT="%F{red}┌[%B%F{%(#.red.blue)}%n%(#.💀.㉿)%m%b%F{%(#.blue.red)}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}[%f%F{yellow}★%f]%f%F{yellow}$%f" ;fi`

5. (optional) Change zshrc.`cp ~/.zshrc ~/.zshrc.bak` and `mv ~/gitclones/pwnbox/configs/zshrc ~/.zshrc`


If you want to test it out before changing your .zshrc file, use `export PROMPT="%F{red}┌[%f%F{green}%D{$(/opt/HTB/vpnserver.sh)}%f%F{red}]─[%f%F{green}%D{$(/opt/HTB/vpnbash.sh)}%f%F{red}][%B%F{%(#.red.blue)}%n%(#.💀.㉿)%m%b%F{%(#.blue.red)}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}[%f%F{yellow}★%f]%f%F{yellow}$%f"`

# Conclusion

This should be it for the setup! The actual pwnbox has some extra icons on the desktop such as a shortcut to "bloodhound", "burpsuite", and others. There's even a MacOS launcher bar on the bottom. I'm going to leave that up to you to add. 

I highly suggest adding VNC support if needed. I am currently running tigerVNC on my Parrot machine and it works great! 

Otherwise, that finishes that for this tutorial.
