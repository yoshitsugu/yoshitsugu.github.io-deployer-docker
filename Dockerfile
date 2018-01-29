FROM haskell:latest

RUN apt-get update -q && \
    apt-get install -qy git xz-utils build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    /root/.local/bin/stack build
