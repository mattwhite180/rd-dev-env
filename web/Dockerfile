#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

SHELL ["/bin/bash", "-c"]

EXPOSE 8080
EXPOSE 1433

WORKDIR /root/

COPY runscript.sh ./
COPY buildscript.sh ./
COPY tests.py ./
COPY bashrc /root/.bashrc
RUN mkdir /root/code
COPY requirements.txt ./
RUN bash buildscript.sh
ENV PATH="/pyenv/bin/:$PATH"
ENV PATH="/root/.pyenv/versions/3.6.5/bin:$PATH"



COPY rd-api /root/code

#RUN source /root/.bashrc

#CMD python tests.py


CMD echo 'testing'
