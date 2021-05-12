#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

SHELL ["/bin/bash", "-c"]

WORKDIR /root/

RUN apt-get update && apt-get install npm git -y

RUN useradd --no-log-init -ms /bin/bash leaduser

EXPOSE 1433
EXPOSE 4200

RUN mkdir code

COPY lead-mgmt code

RUN chown -R leaduser /root

RUN echo '127.0.0.1 localhost.rentdynamics.com' > /etc/hosts

WORKDIR /root/code/

RUN npm install -g npm@5.6.0

RUN apt update && apt install ng-common -y

USER leaduser

RUN /bin/bash -c "source ~/.bashrc && npm install"

RUN npm run publish:dev

CMD npm run localserve

# CMD echo "ready!"