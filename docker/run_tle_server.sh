docker run                                      \
  --rm -it --name=tle-server                    \
  -p 0.0.0.0:5000:5000                          \
  --net=tle-network                             \
  -v ${PWD}/../bin:/data/Lacuna-Server/bin      \
  -v ${PWD}/../docs:/data/Lacuna-Server/docs    \
  -v ${PWD}/../etc:/data/Lacuna-Server/etc      \
  -v ${PWD}/../lib:/data/Lacuna-Server/lib      \
  -v ${PWD}/../t:/data/Lacuna-Server/t          \
  -v ${PWD}/../var:/data/Lacuna-Server/var      \
  --volumes-from tle-captcha-data               \
  -e TLE_NO_MIDDLEWARE=1 \
  lacuna/tle-server /bin/bash

