FROM debian:stable

RUN apt-get update \
    && apt-get install --no-install-recommends -y git hub ca-certificates autoconf automake gettext autopoint libtool make g++ texinfo curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV ROOT_HOME /root

WORKDIR ${ROOT_HOME}
RUN git clone https://github.com/emcrisostomo/fswatch.git

WORKDIR ${ROOT_HOME}/fswatch
RUN ./autogen.sh && ./configure && make -j

COPY auto-commit.sh auto-commit.sh
