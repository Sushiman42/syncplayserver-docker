# Syncplay Server - Docker

A docker image for running a [Syncplay](https://syncplay.pl/) server. Pulls the most up-to-date Syncplay build.

[![syncplay](https://raw.githubusercontent.com/Syncplay/syncplay/master/syncplay/resources/hicolor/128x128/apps/syncplay.png)](https://syncplay.pl/)

## Useage

```
docker run -d \
  -p 8999:8999 \
  -e SALT=E1F53135E559C253 \
  -e PORT=8999 \
  -e PASSWORD=CHANGEME \
  -e ISOLATE=FALSE \
  -e DISABLEREADY=FALSE \
  -e DISABLECHAT=FALSE \
  -e MAXCHATLENGTH=120 \
  -e MAXUNAMELENGTH=20 \
  -e MOTD=TRUE \
  -e TLS=TRUE \
  -v /path/to/motd.txt:/motd.txt \
  -v /path/to/certs:/certs \
sushiman42/syncplayserver-docker
```

## [Docker Compose](https://github.com/Sushiman42/syncplayserver-docker/blob/main/docker-compose.yml) (Recommended)

```
version: "3"
services:
  syncplay:
    image: sushiman42/syncplayserver-docker:latest
    restart: always
    ports:
      - 8999:8999
    environment:
      - SALT=E1F53135E559C253
      - PORT=8999
      - PASSWORD=CHANGEME
      - ISOLATE=FALSE
      - DISABLEREADY=FALSE
      - DISABLECHAT=FALSE
      - MAXCHATLENGTH=120
      - MAXUNAMELENGTH=20
      - MOTD=TRUE
      - TLS=TRUE
    volumes:
      - /path/to/motd.txt:/motd.txt
      - /path/to/certs:/certs
 ```
 
 ## Parameters
 
 See the [Syncplay server guide](https://syncplay.pl/guide/server/) for more detailed explanations of these parameters.
 
| Parameter | Function |
| :----: | --- |
| `-p 8999` | Change this as well as -e PORT for a nonstandard port mapping |
| `-e SALT=<salt string>` | Optional, remove for no salt |
| `-e PORT=8999` | Default is 8999, change along with -p for nonstandard port mapping |
| `-e PASSWORD=<password string>` | Optional, remove to disable server password |
| `-e ISOLATE=FALSE` | Set to TRUE for **room isolation** |
| `-e DISABLEREADY=FALSE` | Set to TRUE to disable the readiness indicator feature |
| `-e DISABLECHAT=FALSE` | Set to TRUE to disable chat |
| `-e MAXCHATLENGTH=<x>` | Optional, remove to disable chat char. limit |
| `-e MAXUNAMELENGTH=<x>` | Optional, remove to disable username char. limit |
| `-e MOTD=FALSE` | Optional, set to TRUE to use an MOTD file |
| `-e TLS=FALSE` | Optional, set to TRUE to use TLS CERTS |
| `-v /path/to/motd.txt:/motd.txt` | Specify path to MOTD file if set to TRUE above |
| `-v /path/to/certs:/certs` | Specify path to certs folder if set to TRUE above (visit [letsencrypt](https://letsencrypt.org/) for certs) |

## Possible updates
Only if I feel motivated

* UID/GID support
* Healthcheck implementation
* ctrl-c sigkill when inside container
