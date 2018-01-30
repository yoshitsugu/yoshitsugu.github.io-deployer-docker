FROM buildpack-deps:jessie

ENV PATH $PATH:/root/.local/bin

RUN apt-get update -q && \
    apt-get install -qy ruby ruby-dev --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://get.haskellstack.org/ | sh
RUN gem install sass --no-ri --no-rdoc

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    git checkout source && \
    stack setup
RUN cd yoshitsugu.github.io && stack build
