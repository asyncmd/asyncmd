FROM debian:9

RUN apt-get update \
    && apt-get install --no-install-recommends -y git hub autoconf automake gettext autopoint libtool make g++ texinfo curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV ROOT_HOME /root
ENV FSWATCH_BRANCH @ax_git_current_branch@

WORKDIR ${ROOT_HOME}
RUN git clone https://github.com/emcrisostomo/fswatch.git

WORKDIR ${ROOT_HOME}/fswatch
RUN git checkout ${FSWATCH_BRANCH}
RUN ./autogen.sh && ./configure && make -j

COPY auto-commit.sh auto-commit.sh
