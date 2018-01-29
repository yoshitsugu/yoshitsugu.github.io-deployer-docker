FROM haskell:latest

RUN apt-get update -q && \
    apt-get install -qy git xz-utils build-essential curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://get.rvm.io | bash && \
    rvm install 2.5.0 && \
    gem install sass --no-ri --no-rdoc

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    git branch source && \
    /root/.local/bin/stack build
