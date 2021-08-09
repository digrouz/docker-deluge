
[![auto-update-workflow](https://github.com/digrouz/docker-deluge/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-nzbhydra2/actions/workflows/auto-update.yml)
[![dockerhub-workflow](https://github.com/digrouz/docker-deluge/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-nzbhydra2/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/deluge)

# docker-deluge
Installs Deluge into a Linux container

![deluge](https://dev.deluge-torrent.org/chrome/common/deluge_logo.png)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-deluge/blob/master/Dockerfile_alpine)
* any version specific tag is based on alpine.

## Description

Deluge is a fully-featured cross-platform BitTorrent client.

https://deluge-torrent.org/

## Usage
    docker create --name=deluge  \
      -v /etc/localtime:/etc/localtime:ro \ 
      -v <path to config>:/config \
      -e DOCKUID=<UID default:10034> \
      -e DOCKGID=<GID default:10034> \
      -e DOCKUPGRADE=<0|1> \
      -p 8112:8112 \
      -p 58846:58846 \
      -p 58946:58946 \
      -p 58946:58946/udp digrouz/deluge:latest

## Environment Variables

When you start the `deluge` image, you can adjust the configuration of the `deluge` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10034`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10034`.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

## Notes

* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e DOCKUPGRADE=1` at container creation.


## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-deluge/issues)
