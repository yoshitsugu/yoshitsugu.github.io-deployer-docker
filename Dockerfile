FROM haskell:latest

RUN apt-get update -q && \
    apt-get install -qy git xz-utils build-essential curl ruby ruby-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install sass --no-ri --no-rdoc

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    git checkout source && \
    /root/.local/bin/stack build
