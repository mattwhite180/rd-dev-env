FROM node:8.9.4

SHELL ["/bin/bash", "-c"]

WORKDIR /root/

RUN apt-get update && apt-get install npm git ng-common -y

RUN useradd --no-log-init -ms /bin/bash leaduser

EXPOSE 1433

EXPOSE 4200

RUN mkdir code

COPY lead-mgmt code

RUN chown -R leaduser /root
RUN chown -R leaduser /home


RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g npm@5.6.0
RUN npm set progress=false

RUN echo '127.0.0.1 localhost.rentdynamics.com' > /etc/hosts

RUN apt update && apt install vim -y

USER leaduser

WORKDIR /root/code

RUN npm install --verbose

RUN npm run publish:dev

# CMD npm run localserve

CMD echo "ready!"
