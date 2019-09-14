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
deb http://cdn-fastly.deb.debian.org/debian/ jessie main contrib non-free
deb-src http://cdn-fastly.deb.debian.org/debian/ jessie main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
```
[RE: Above] *gitlab doesn't **copy / paste** correctly to nano terminal on Win 10 so link:*
- https://github.com/communityus-private/SteamOS/wiki
# Update to Jessie
```
sudo apt update && sudo apt upgrade -y
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
