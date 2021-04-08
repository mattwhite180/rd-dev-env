# rd-dev-env
![Python Badge](https://img.shields.io/badge/Python-3.6.5-informational?style=plastic&logo=python&logoColor=green&color=green)
![Docker Badge](https://img.shields.io/badge/Docker-Debian-informational?style=plastic&logo=docker&logoColor=blue&color=blue)

| main | dev |
|------|-----|
| [![UnitTests](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml/badge.svg?branch=master)](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml) | [![Docker Image CI](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml/badge.svg?branch=dev)](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml) |


## About
* uses the [Debian](https://hub.docker.com/_/debian) docker image

## Installing Docker on Ubuntu 20.04
```
sudo apt install docker docker-compose docker-doc docker.io -y
sudo usermod -aG docker $USER
sudo systemctl enable docker
# reboot your computer
```

## Execute Program
* run it normally
	* `./run.sh`
* run and attach shell
	* `./run.sh bash`

## USEFUL LINKS:
* [docker postgres](https://docs.docker.com/engine/examples/postgresql_service/)
* https://launchschool.com/blog/how-to-install-postgres-for-linux

