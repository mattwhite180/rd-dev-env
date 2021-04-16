#!/bin/bash

apt-get update -y
apt-get install -y apt-utils npm nodeenv make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev  python-openssl git npm  apt-utils openssl libxmlsec1 pkg-config freetds-dev postgresql apt-utils unixodbc-dev libgssapi-krb5-2 postgresql postgresql-contrib libpq-dev

curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update -y
apt-get install -y dotnet-sdk-3.1
mkdir code
cd code

git config --global user.name "mattwhite180"
git config --global user.email "matthew.white42@aggiemail.usu.edu"

git clone git@github.com:RentDynamics/rd-api.git         # primary repositories...
git clone git@github.com:RentDynamics/lead-mgmt.git
git clone git@github.com:RentDynamics/lanyard.git        # other useful repositories (optional)
git clone git@github.com:RentDynamics/textmsgit-py.git
git clone git@github.com:RentDynamics/email.git

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

apt update
ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

source ~/.bashrc

 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE USER rd WITH PASSWORD 'test1234';" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE DATABASE rentdynamics WITH OWNER rd;" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "CREATE DATABASE rentplus WITH OWNER rd;" &&\
 # PGPASSWORD=test1234 psql -h 172.20.0.2 -U rd postgres --command "ALTER USER rd WITH SUPERUSER;"
 
npm install -g npm

nodeenv --node=8.9.4 ~/env/lead-mgmt
nodeenv --node=8.9.4 ~/env/lanyard 

# 1. active node env
source ~/env/lead-mgmt/bin/activate
# 2. to upgrade npm to latest version
npm install -g npm
# 3. install version of angular-cli globally
npm install -g @angular/cli
# 4. deactivate node env
deactivate_node
# Repeat steps 1-4 for lanyard

# 1. active node env
source ~/env/lanyard/bin/activate
# 2. to upgrade npm to latest version
npm install -g npm
# 3. install version of angular-cli globally
npm install -g @angular/cli
# 4. deactivate node env
deactivate_node
# Repeat steps 1-4 for lanyard

echo alias rdapi='source ~/env/rd-api/bin/activate; cd ~/code/rd-api' >> ~/.bashrc
echo alias textmsgitpy='source ~/env/textmsgit-py/bin/activate; cd ~/code/textmsgit-py' >> ~/.bashrc
echo alias email='source ~/env/email/bin/activate; cd ~/code/email' >> ~/.bashrc
echo alias leadmgmt='source ~/env/lead-mgmt/bin/activate; cd ~/code/lead-mgmt' >> ~/.bashrc
echo alias lanyard='source ~/env/lanyard/bin/activate; cd ~/code/lanyard' >> ~/.bashrc
echo alias gs='git status' >> ~/.bashrc
echo alias gp='git pull' >> ~/.bashrc
echo alias gcom='git checkout master' >> ~/.bashrc
echo alias grh='git reset --hard' >> ~/.bashrc
echo alias pipr='pip3 install -r requirements.txt'  # installs pip package dependencies. run after you've activated your virtual environment >> ~/.bashrc
echo alias refresh_rd_db='psql postgres -c "DROP DATABASE rentdynamics;"; psql postgres -c "CREATE DATABASE rentdynamics with owner rd;"; psql postgres -c "DROP DATABASE rdrentplus;"; psql postgres -c "CREATE DATABASE rdrentplus with owner rd;"' >> ~/.bashrc  # this will drop and recreate your local postgres databases. You will need to migrate them afterwards

echo "127.0.0.1  localhost.rentdynamics.com" > /private/etc/hosts

source ~/.bashrc

rdapi

pip3 install -r requirements.txt

python tests.py

python manage.py migrate
python manage.py test
