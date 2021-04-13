# rd-dev-env
![Python Badge](https://img.shields.io/badge/Python-3.6.5-informational?style=plastic&logo=python&logoColor=green&color=green)
![Docker Badge](https://img.shields.io/badge/Docker-Debian-informational?style=plastic&logo=docker&logoColor=blue&color=blue)
![Docker Badge](https://img.shields.io/badge/DockerCompose-3.3-informational?style=plastic&logo=docker&logoColor=blue&color=blue)

| main | dev |
|------|-----|
| [![UnitTests](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml/badge.svg?branch=master)](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml) | [![Docker Image CI](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml/badge.svg?branch=dev)](https://github.com/mattwhite180/rd-dev-env/actions/workflows/docker.yml) |


## About
* uses the [Debian](https://hub.docker.com/_/debian) docker image

## Installing Docker on Ubuntu 20.04
```
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt update; sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo 'should match: 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88'
sudo apt update
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-compose docker-ce docker-ce-cli containerd.io -y
# reboot your computer
```

## Execute Program
* run it normally
	* `docker-compose up`
* run and attach shell
	* `docker-compose run web bash`
	* `psql -U rd postgres`

## USEFUL LINKS:
* [docker-compose postgres](https://docs.docker.com/compose/django/)

