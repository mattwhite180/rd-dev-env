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
sudo apt install docker docker-compose docker-doc docker.io -y
sudo usermod -aG docker $USER
sudo systemctl enable docker
# reboot your computer
```

## Execute Program
* run `docker-compose build`
* run `docker-compose run web bash`
* get local ip of container `hostname -I | awk '{print $1}'`
* to access the postgres database, run `PGPASSWORD=test1234 psql -h <local-ip> -U rd postgres`
	* for `<local-ip>`, use the ip from `hostname -I | awk '{print $1}'` but change the last number to one less than itself
	* for example if `hostname -I | awk '{print $1}'` returns `172.21.0.3`, you will use `172.21.0.2` for `<local-ip>`
	* example: `PGPASSWORD=test1234  psql -h 172.21.0.2 -U rd postgres`
## USEFUL LINKS:
* [docker-compose postgres](https://docs.docker.com/compose/django/)
* [setting up postgres in ubuntu](https://launchschool.com/blog/how-to-install-postgres-for-linux)
