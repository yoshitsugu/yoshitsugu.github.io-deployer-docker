FROM haskell:latest

RUN apt-get update -q && \
    apt-get install -qy git xz-utils build-essential curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    \curl -sSL https://get.rvm.io | bash -s stable --ruby && \
    . /usr/local/rvm/scripts/rvm && \
    gem install sass --no-ri --no-rdoc

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    git branch source && \
    /root/.local/bin/stack build
