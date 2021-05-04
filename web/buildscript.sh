#!/bin/bash

apt-get update -y
apt-get install -y apt-utils libxmlsec1-dev xmlsec1 libxmlsec1-openssl npm nodeenv unixodbc tdsodbc python3-pymssql freetds-bin make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev  python-openssl git npm  apt-utils openssl libxmlsec1 pkg-config freetds-dev postgresql apt-utils unixodbc-dev libgssapi-krb5-2 postgresql postgresql-contrib libpq-dev
apt-get install git -y
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update -y
apt-get install -y dotnet-sdk-3.1
echo 'PATH="$/pyenv/bin:$PATH"' >> /root/.bashrc
echo 'PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc
echo 'PATH="/pyenv/bin/:$PATH"' >> /root/.bashrc
echo 'alias python="/root/.pyenv/versions/3.6.5/bin/python"' >> /root/.bashrc
source /root/.bashrc

git clone -b 1.2.26 https://github.com/pyenv/pyenv /pyenv

eval "$(pyenv init -)"

pyenv install 3.6.5

pyenv global 3.6.5

echo 'export LDFLAGS="-L/usr/local/opt/openssl/lib"' >> /root/.bashrc
echo 'export CPPFLAGS="-I/usr/local/opt/openssl/include"' >> /root/.bashrc
echo 'export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"' >> /root/.bashrc
echo 'export PYCURL_SSL_LIBRARY=openssl' >> /root/.bashrc

pip3 install virtualenv

mkdir /root/code
mkdir /root/env
mv /home/rd-api /root/code

apt update
ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> /root/.bashrc

source /root/.bashrc


#createuser --superuser rd

#USER rd

#service postgresql start

# npm install -g npm

# nodeenv --node=8.9.4 /root/env/lead-mgmt
# nodeenv --node=8.9.4 /root/env/lanyard 

# # 1. active node env
# source /root/env/lead-mgmt/bin/activate
# # 2. to upgrade npm to latest version
# npm install -g npm
# # 3. install version of angular-cli globally
# npm install -g @angular/cli
# # 4. deactivate node env
# deactivate_node
# # Repeat steps 1-4 for lanyard

# # 1. active node env
# source /root/env/lanyard/bin/activate
# # 2. to upgrade npm to latest version
# npm install -g npm
# # 3. install version of angular-cli globally
# npm install -g @angular/cli
# # 4. deactivate node env
# deactivate_node
# # Repeat steps 1-4 for lanyard

# echo alias rdapi='source /root/env/rd-api/bin/activate; cd /root/code/rd-api' >> /root/.bashrc
# echo alias textmsgitpy='source /root/env/textmsgit-py/bin/activate; cd /root/code/textmsgit-py' >> /root/.bashrc
# echo alias email='source /root/env/email/bin/activate; cd /root/code/email' >> /root/.bashrc
# echo alias leadmgmt='source /root/env/lead-mgmt/bin/activate; cd /root/code/lead-mgmt' >> /root/.bashrc
# echo alias lanyard='source /root/env/lanyard/bin/activate; cd /root/code/lanyard' >> /root/.bashrc
# echo alias gs='git status' >> /root/.bashrc
# echo alias gp='git pull' >> /root/.bashrc
# echo alias gcom='git checkout master' >> /root/.bashrc
# echo alias grh='git reset --hard' >> /root/.bashrc
# echo alias pipr='pip3 install -r requirements.txt'  # installs pip package dependencies. run after you've activated your virtual environment >> /root/.bashrc
# echo alias refresh_rd_db='psql postgres -c "DROP DATABASE rentdynamics;"; psql postgres -c "CREATE DATABASE rentdynamics with owner rd;"; psql postgres -c "DROP DATABASE rdrentplus;"; psql postgres -c "CREATE DATABASE rdrentplus with owner rd;"' >> /root/.bashrc  # this will drop and recreate your local postgres databases. You will need to migrate them afterwards

mkdir -p /private/etc/
echo "127.0.0.1  localhost.rentdynamics.com" > /private/etc/hosts

# source /root/.bashrc

# source /root/env/rd-api/bin/activate

cd /root/code/

pip install --no-cache-dir -r requirements.tx

# python tests.py

# python manage.py makemigrations
# python manage.py runserver
