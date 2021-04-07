FROM debian:buster

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN apt-get update && apt-get install build-essential procps curl file git sudo -y

COPY tests.py ./

ENV PYENV_ROOT "/pyenv"
ENV PATH "$PYENV_ROOT/bin:$PATH"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
ENV PATH="/pyenv/bin/:$PATH"

RUN git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
RUN mkdir ~/.linuxbrew/bin
RUN ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
RUN eval $(~/.linuxbrew/bin/brew shellenv)

ENV PATH="~/.linuxbrew/bin/:$PATH"
ENV PATH="~/.linuxbrew/Homebrew/bin/:$PATH"

#CMD echo "hello world"

RUN ~/.linuxbrew/bin/brew update
RUN ~/.linuxbrew/bin/brew install pyenv

RUN pyenv install 3.6.5
RUN pyenv global 3.6.5


CMD python tests.py


