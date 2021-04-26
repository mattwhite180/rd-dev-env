#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

SHELL ["/bin/bash", "-c"]

WORKDIR ~/

COPY script.sh ./
COPY tests.py ./
COPY rd-api/ /home

EXPOSE 8080

RUN bash script.sh

ENV PATH="/pyenv/bin/:$PATH"
ENV PATH="/root/.pyenv/versions/3.6.5/bin:$PATH"

#RUN source ~/.bashrc

#CMD python tests.py
CMD echo 'hello world'
