## A quick start to running Lacuna Expanse Server in Docker

Docker is a quick and easy way (well, compared to trying to build a server from 
scratch!) of getting a development system up and running so you can experiment
and modify the Lacuna Expanse server code.

Please read the documents at ![Install Docker Engine](https://docs.docker.com/engine/installation/)
for your specific system.

(There are a few additional notes below based on our experience of installing Docker)

### Installing on OS X.

On OS X Docker runs in a Virtual Box, the default base memory is 1024 MB but
it might be too little, in which case you need to set higher, say 8196 as 
follows. (Note this will blow-away your current docker containers if you have
any!)

    $ docker-machine rm default
    $ docker-machine create --driver virtualbox --virtualbox-memory 8096 default
    $ eval "$(docker-machine env default)"
