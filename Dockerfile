#FROM amazonlinux:2.0.20210326.0

FROM debian:buster

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

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

CMD python tests.py


