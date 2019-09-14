Note: Not complete yet.

The files contained herein are represent the code that drives the server for the
game called "The Lacuna Expanse". 

This code is distributed under the terms set forth in info/license.txt.

For more information about The Lacuna Expanse visit http://www.lacunaexpanse.com/

For more information about The Lacuna Expanse Developers Program visit
http://www.lacunaexpanse.com/developers

```
cd ~
passwd
sudo apt install openssh-server -y
```
Upgrading distribution can cause screen to go black, you will want to be on a remote machine. Secure it after.
# Remote in 2 or 3 sessions
`ssh desktop@192.168.0.37`  |  192.168.x.x (x = your server IP)
```
sudo apt install steamos-beta-repo
sudo apt update && sudo apt upgrade -y
```
# SteamOS Beta (aka Debian 8:Jesssie)
```
sudo nano /etc/apt/sources.list
```
# Append `sources.list`:
```
deb http://httpredir.debian.org/debian jessie main contrib non-free
deb-src http://httpredir.debian.org/debian jessie main contrib non-free

deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
```
(GitLab) https://github.com/communityus/pt-Open/blob/master/README.txt
(Mirrors) https://linuxconfig.org/debian-apt-get-stretch-sources-list
# Update to Jessie
```
sudo apt update && sudo apt upgrade -y
aptitude search '~o'
```
# Optional
maybe this? `apt remove `aptitude -F %p search ‘~o’ | grep -E -v ^lib``
- `dpkg -C`
- `sudo apt-mark showhold`
- `sudo apt-get autoremove` apt?
- `cd /etc/apt/apt.conf.d/`         
- `sudo rm 50unattended-upgrades.ucf-old`
https://linuxconfig.org/how-to-upgrade-debian-8-jessie-to-debian-9-stretch
[pic1]
```
sudo apt remove linux-headers-4.16.0-0.steamos2.1-amd64 linux-headers-4.16.0-0.steamos2.1-common linux-image-4.16.0-0.steamos2.1-amd64 linux-kbuild-4.16
sudo nano /etc/apt/sources.list
```
# Replace in `sources.list`:
- `brewmaster` to `clockwerk`
- `jessie` becomes `stretch`
- remove `deb-src` & `contrib non-free` for sanity (limit what can go wrong) left clockwerk in because that is Steam designed for us.
```
## internal SteamOS repo
deb http://repo.steampowered.com/steamos clockwerk main contrib non-free
deb-src http://repo.steampowered.com/steamos clockwerk main contrib non-free

deb http://httpredir.debian.org/debian stretch main
# deb-src http://httpredir.debian.org/debian stretch main

deb http://httpredir.debian.org/debian stretch-updates main
# deb-src http://httpredir.debian.org/debian stretch-updates main

deb http://security.debian.org/ stretch/updates main
# deb-src http://security.debian.org/ stretch/updates main
```
# Command line
```
sudo nano /etc/apt/sources.list.d/steamos-beta-repo.list
```
# Replace in `steamos-beta-repo.list`:
- `brewmaster_beta` to `clockwerk_beta`
```
deb http://repo.steampowered.com/steamos clockwerk_beta main contrib non-free
```
# Command line
- *We have removed kernel stuff, don't reboot till we get new kernel in!*
```
sudo apt update && sudo apt upgrade -y
```
# We say yes
[pic2]
# We say yes a lot! (`your choice`) (1,2...3 [grub], 4, 5 [50unattended-upgrades])
[pic3]
[pic4]
[pic5]
```
remove:
gir1.2-gweather-3.0 libavresample3 libavutil55 libbs2b0 libgnome-autoar-0-0 libgnome-autoar-common libgrilo-0.3-0 liblilv-0-0 libnuma1 libpcre2-8-0 libserd-0-0 libsord-0-0 libsoxr0 libsratom-0-0 libx265-95
libmpcdec6 libnpth0 libva-drm1 libva-x11-1 libvpx4 libwildmidi2
```
# STOP (rest not done)
could need to do below plus a bunch of auto-remove / clean
- but i think all we do is:
```
sudo aptitude dist-upgrade
```
# Say yes a lot (see we were brainwashing you not to question us :-) )
`Current status: 7 broken [+7], 110 updates [-50].`
```
sudo apt --fix-broken install
sudo apt dist-upgrade
sudo apt-get dist-upgrade
```

```
sudo apt remove gir1.2-gnomekeyring-1.0 gir1.2-gweather-3.0 gir1.2-notify-0.7 gnome-software-common libappstream-glib8 libasan3 libavresample3 libavutil55 libbs2b0 libgnome-autoar-common libgnome-keyring-common libgnome-keyring0 libgom-1.0-0 libgom-1.0-common libgrilo-0.3-0 libgtkspell3-3-0 libhyphen0 libnuma1 libpcre2-8-0 libquvi-scripts-0.9 libserd-0-0 libshine3 libsord-0-0 libsoxr0 libsratom-0-0 libssh-gcrypt-4 libswresample2 libswscale4 libx265-95 libxcb-res0 libzvbi-common libzvbi0 lua-bitop lua-expat lua-json lua-lpeg lua-socket python3-requests python3-urllib3  
sudo apt remove libavutil55 libbs2b0 libcrystalhd3 libfwupd1 libgcab-1.0-0 libgcc-6-dev libgnome-autoar-0-0 libpcre2-8-0 libserd-0-0 libsord-0-0 libsoxr0 libsratom-0-0 libva-drm1 libva-x11-1 libvpx4 libwildmidi2 libavutil55 libbs2b0 libcrystalhd3 libfwupd1 libhyphen0 libjxr-tools libjxr0 liblilv-0-0 liblua5.3-0 libmediaart-2.0-0 libmpcdec6 libmpx2 libnpth0 libswscale4 libtwolame0 libva-drm1 libva-x11-1 libvpx4 libwebpmux2 libwildmidi2 libwmf0.2-7 libx264-148
sudo apt dist-upgrade
```
```
sudo apt install ca-certificates curl gnupg2 apt-transport-https software-properties-common git -y
sudo sh -c "echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt update
sudo apt install docker-engine -y
```
# Choose Branches i.e. "Captcha"
```
git clone https://github.com/communityus-private/Lacuna-Web-Client
git clone https://github.com/communityus-private/Lacuna-Server-Open
```
# continue here:
https://github.com/communityus/pt-Open/tree/master/docker
- that readme is much closer to what we need for now.


# STOP - Below is not done yet
```
mkdir ~/Lacuna-Server-Open/etc
cd ~/Lacuna-Server-Open/etc-templates
cp lacuna.conf.docker ../etc/lacuna.conf
cp log4perl.conf.docker ../etc/log4perl.conf
cp nginx.conf.docker ../etc/nginx.conf
cd ~/Lacuna-Server-Open/docker
```
# Options
```
sudo docker create --name tle-server lacuna/tle-server
```
```
sudo docker build -t lacuna/tle-nginx -f tle-nginx/Dockerfile .
```

```
sudo docker create --name tle-mysql-data arungupta/mysql-data-container
sudo docker run --rm -it --name=tle-server -p 5000:5000 --volumes-from tle-mysql-data -v ${PWD}/bin:/data/Lacuna-Server/bin -v ${PWD}/lib:/data/Lacuna-Server/lib -v ${PWD}/etc:/data/Lacuna-Server/etc -v ${PWD}/var:/data/Lacuna-Server/var lacuna/tle-server /bin/bash
```
# Switch windows
`[ssh instance 2]`
```
sudo docker exec -it tle-server bash
```
