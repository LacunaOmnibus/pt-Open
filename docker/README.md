### Installing on SteamOS Brewmaster_Beta (Debian 8:Jessie)
For Mac: https://github.com/communityus/pt-Open/blob/master/docker/README-Mac.md

## Setting up your dev environment

You need to checkout the code from github into a local directory as normal, I
will assume you are checking out to 

    ~/Lacuna-Server
    ~/Lacuna-Web-Client

You need to create some config files for the docker config,

    $ cd ~/Lacuna-Server/etc
    $ cp lacuna.conf.docker lacuna.conf
    $ cp log4perl.conf.docker log4perl.conf
    $ cp nginx.conf.docker nginx.conf

It is unlikely that you will need to change these config files from their
defaults.

### Starting up the docker containers.

In Lacuna-Server-Open there is a sub-directory 'docker'

```
cd ~/Lacuna-Server/docker
```

Setting up a server is as simple as running the following scripts, in this
order

    $ ./create_tle_network.sh
    $ ./create_tle_data.sh
    $ ./run_tle_beanstalk.sh
    $ ./run_tle_memcached.sh
    $ ./run_tle_mysql_server.sh
    
Now we need to build our TLE server:
```
docker build -t lacuna/tle-server -f tle-server/Dockerfile .
```
Now we can run the server from our local docker image:

    $ ./run_tle_server.sh (leave this running in a terminal session for now, otherwise nginx will not work!)

That will put you into the container and map up all the .conf's and folders/files from your local git repo dirs.
```
leave command line windows open for now
```

Use another command line window (mentioned here):
https://github.com/communityus/pt-Open#remote-in-2-or-3-sessions
```
cd ~/Lacuna-Server/docker
docker build -t lacuna/tle-nginx -f tle-nginx/Dockerfile .
```
    $ ./run_tle_nginx.sh
    
Cont. here: 
- https://github.com/communityus/pt-Open/blob/master/docker/README.md#initial-configuration

If this has worked, you can now do the following to see what is running.

    $ docker ps -a

This should show you have several docker containers running (i.e. Status
of 'Up xx minutes').

These containers are fairly self-explanatory.

### tle-beanstalk

This runs the beanstalk message queue. It is a standard Docker container.
It is used to run job queues for building upgrade completion, ship arrival
and captcha generation.

### tle-memcached

Again a standard Docker container with default ports.

### tle-mysql-server

This is a standard Docker MySql server. You can also connect to this
container to run a mysql client to inspect and modify your database.

### tle-mysql-data

This is a container, but it is data-only. It is never run. This allows you
to have a persistent database for mysql. You can start/stop other containers
but your mysql data will remain.

If you ever want to 'blow-away' your database and start again then you
should first stop and remove all containers that refer to it (tle-mysql)
and then do the following.

    $ docker rm -v tle-mysql-data
    $ ./create_tle_data.sh

### tle-nginx

This is your web server which exposes the docker port to the outside world.
By default this will run the web server on localhost port 8000 (but this can
be configured).

### tle-server

This is the Server Code. You can start and restart your development server
from within this container. This will put you into the Docker container in the 
bash shell. Normally you will just run the command



    $ ./startdev(.sh) but we are not ready yet.

Finish setup below:

But there are a few things you need to do first (see below, Initial Configuration).


## Initial configuration

There are a few things you need to do to set up your development system.

If you have just created your tle-mysql-data container then it will be empty.

The first time you run up the tle-server you need to run a few commands.

    $ cd /data/Lacuna-Server/bin
    $ mysql --host=tle-mysql-server -uroot -placuna
    mysql> source docker.sql
    mysql> exit

This sets up the mysql user account 'lacuna' which is used by the web application.

(Note that the root mysql account has been given the password 'lacuna').

You now need to initialize the database. (this will take a few minutes).

    $ cd /data/Lacuna-Server/bin/setup
    $ perl init_lacuna.pl


Captchas no longer need to be generated up-front. They will be generated
on demand (so long as the schedule_captcha.pl script is running).

Note however, the first request for a captcha will fail, subsequent
requests will however succeed, so long as the schedule_captcha.pl 
daemon is running.

You may want to generate the html version of the documentation so you
can view it in your web browser.

    $ cd /data/Lacuna-Server/bin
    $ perl generate_docs.pl


## Running schedulers

There are some processes which run as daemons on the server, these control
the arrival of ships or the completion of a building upgrade. These take
their jobs off the beanstalk queue at the time when the task is to be
completed.

Normally you would run these as a daemon as follows.

    $ perl schedule_building.pl --noquiet
    $ perl schedule_ship_arrival.pl --noquiet
    $ perl schedule_captcha.pl --noquiet

The --noquiet argument ensures that their actions are logged into log files
which you can choose to tail in another terminal session.

    /tmp/schedule_building.log
    /tmp/schedule_ship_arrival.log
    /tmp/schedule_captcha.log

## Running the server (finally!)

You can now run the development server

    $ ./startdev.sh

This will run in the current terminal session, type ctrl-c to terminate
the script at any time.

If you want to make changes to the code, it is best to do so from your host
environment (simply because you will have better tools and editors).

When you are ready to test, just stop this script with ctrl-c and restart it.

Type 'exit' to exit the docker container and return to the host and stop the container.

