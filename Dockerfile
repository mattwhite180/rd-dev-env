FROM amazonlinux:2.0.20210326.0

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN yum install tar yum install make git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel -y

COPY tests.py ./
#COPY script.sh ./

#RUN bash script.sh

ENV PYENV_ROOT "/pyenv"
ENV PATH "$PYENV_ROOT/bin:$PATH"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
ENV PATH="/pyenv/bin/:$PATH"

COPY pyenv/ /pyenv

RUN eval "$(pyenv init -)"

RUN pyenv install 3.6.5

RUN pyenv global 3.6.5

CMD python tests.py


