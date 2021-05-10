#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

SHELL ["/bin/bash", "-c"]


WORKDIR /root/

COPY runscript.sh ./
COPY buildscript.sh ./
COPY tests.py ./
COPY bashrc /root/.bashrc
RUN mkdir /root/code
COPY rd-api /root/code

EXPOSE 8080
EXPOSE 1433

RUN bash buildscript.sh

ENV PATH="/pyenv/bin/:$PATH"
ENV PATH="/root/.pyenv/versions/3.6.5/bin:$PATH"

#RUN source /root/.bashrc

#CMD python tests.py


CMD echo 'testing'
