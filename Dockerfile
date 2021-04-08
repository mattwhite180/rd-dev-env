#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

SHELL ["/bin/bash", "-c"]

WORKDIR ~/

#COPY /home/mattw/rd-api ~/code

RUN apt-get update -y \
    && apt-get install -y \
        make \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        python-openssl \
        git \
	openssl libxmlsec1 pkg-config freetds-dev postgresql \
    && rm -rf /var/lib/apt/lists/*

COPY tests.py ./

ENV PYENV_ROOT "/pyenv"
ENV PATH "$PYENV_ROOT/bin:$PATH"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
ENV PATH="/pyenv/bin/:$PATH"

RUN git clone -b 1.2.26 https://github.com/pyenv/pyenv /pyenv

RUN eval "$(pyenv init -)"

RUN pyenv install 3.6.5

RUN pyenv global 3.6.5

RUN echo 'export LDFLAGS="-L/usr/local/opt/openssl/lib"' >> ~/.bashrc
RUN echo 'export CPPFLAGS="-I/usr/local/opt/openssl/include"' >> ~/.bashrc
RUN echo export 'PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"' >> ~/.bashrc
RUN echo export 'PYCURL_SSL_LIBRARY=openssl' >> ~/.bashrc

RUN pip3 install virtualenv

RUN mkdir ~/code
RUN mkdir ~/env

#RUN git clone git@github.com:RentDynamics/rd-api.git ~/code

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc

RUN source ~/.bashrc

RUN apt-get install -y unixodbc-dev libgssapi-krb5-2

CMD python tests.py


