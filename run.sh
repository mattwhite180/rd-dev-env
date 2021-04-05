#!/bin/bash

docker build -t rd-dev-env:v1 . && docker run -it rd-dev-env:v1 $1 $2 $3 $4 $5 $6
