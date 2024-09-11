FROM ubuntu:22.04 AS buildroot
ARG DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Install buildroot dependencies.
# From: https://buildroot.org/downloads/manual/manual.html#requirement
#
# TODO Better documentation explaining which dependency is required by what.
RUN apt-get update \
  && apt-get install -y \
  asciidoc \
  bc \
  binutils \
  build-essential \
  bzip2 \
  clang \
  cpio \
  curl \
  diffutils \
  file \
  findutils \
  g++ \
  gcc \
  genext2fs \
  git \
  graphviz \
  gzip \
  libncurses-dev \
  patch \
  perl \
  python2 \
  python3 \
  rsync \
  ssh \
  subversion \
  tar \
  unzip \
  w3m \
  wget \
  && rm -rf /var/cache/apt/* \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

VOLUME /buildroot
VOLUME /buildroot/output
VOLUME /hcfw

WORKDIR /buildroot

COPY ./buildroot.sh /buildroot.sh

ENTRYPOINT ["/buildroot.sh"]
