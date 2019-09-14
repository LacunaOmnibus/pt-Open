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
# Ssh:`1` (continue in your terminal/shell/whatever you call it)
```
sudo nano /etc/apt/sources.list.d/steamos-beta-repo.list
```
# Replace in `steamos-beta-repo.list`:
- `brewmaster_beta` to `clockwerk_beta`
```
deb http://repo.steampowered.com/steamos clockwerk_beta main contrib non-free
```
# Ssh:`1`
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
