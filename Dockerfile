FROM ruby:2.6.3

ENV PATH $PATH:/root/.local/bin

RUN curl -sSL https://get.haskellstack.org/ | sh
RUN gem install sass

RUN stack upgrade && \
    git clone https://github.com/yoshitsugu/yoshitsugu.github.io.git && \
    cd yoshitsugu.github.io && \
    git checkout source && \
    stack setup
RUN cd yoshitsugu.github.io && stack build
