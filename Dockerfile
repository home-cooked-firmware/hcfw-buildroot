FROM ubuntu:22.04 AS buildroot
ARG DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Set default UID and GID for container user to 1000.
# Many Linux distros set the UID/GID for the first real user to 1000,
# so this default should work in a lot of cases.
#
# Users with other UID/GIDs may notice file permission issues with Buildroot's
# output. To user an alternative UID/GID pair, create a `.env` file and set
# UID and GID to values that match the user on your host machine.
ARG UID=1000
ARG GID=1000

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
  libcurl4-openssl-dev \
  libffi-dev \
  libncurses-dev \
  libsqlite3-dev \
  libuv1-dev \
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

# Set up buildroot user
RUN groupadd -g "${GID}" buildroot \
  && useradd --no-log-init -u "${UID}" -g "${GID}" buildroot

USER buildroot

VOLUME /buildroot
VOLUME /hcfw

WORKDIR /buildroot

COPY ./buildroot.sh /buildroot.sh

ENTRYPOINT ["/buildroot.sh"]
