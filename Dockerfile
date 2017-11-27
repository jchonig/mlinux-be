FROM ubuntu:trusty

ARG install_deps_url="http://git.multitech.net/cgi-bin/cgit.cgi/mlinux.git/plain/install-deps/install-debian-ubuntu-deps.sh?h=3"

ADD apt.conf bitbake /

# Build the base container
RUN export APT_CONFIG=apt.conf DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get dist-upgrade \
    && apt-get install wget \
    && wget -q -O - ${install_deps_url} | sh

ADD uname /usr/local/bin

ENTRYPOINT [ "/bitbake" ]




