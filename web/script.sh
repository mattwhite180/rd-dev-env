#!/bin/bash

apt-get update -y
apt-get install -y apt-utils nodeenv make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev  python-openssl git npm  apt-utils openssl libxmlsec1 pkg-config freetds-dev postgresql apt-utils unixodbc-dev libgssapi-krb5-2 postgresql postgresql-contrib libpq-dev

echo 'PATH="$/pyenv/bin:$PATH"' >> ~/.bashrc
echo 'PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'PATH="/pyenv/bin/:$PATH"' >> ~/.bashrc
echo 'alias python="/root/.pyenv/versions/3.6.5/bin/python"' >> ~/.bashrc
source ~/.bashrc

git clone -b 1.2.26 https://github.com/pyenv/pyenv /pyenv

eval "$(pyenv init -)"

pyenv install 3.6.5

pyenv global 3.6.5

echo 'export LDFLAGS="-L/usr/local/opt/openssl/lib"' >> ~/.bashrc
echo 'export CPPFLAGS="-I/usr/local/opt/openssl/include"' >> ~/.bashrc
echo export 'PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"' >> ~/.bashrc
echo export 'PYCURL_SSL_LIBRARY=openssl' >> ~/.bashrc

pip3 install virtualenv

mkdir ~/code
mkdir ~/env

curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt update
ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

source ~/.bashrc

 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE USER rd WITH PASSWORD 'test1234';" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE DATABASE rentdynamics WITH OWNER rd;" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE DATABASE rentplus WITH OWNER rd;" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "ALTER USER rd WITH SUPERUSER;"
 
npm install -g npm

# nodeenv --node=8.9.4 ~/env/lead-mgmt
# nodeenv --node=8.9.4 ~/env/lanyard 


python tests.py
