FROM ubuntu:trusty

VOLUME /root/.zcash

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
	build-essential pkg-config libc6-dev m4 g++-multilib \
	autoconf libtool ncurses-dev unzip git python \
	zlib1g-dev wget bsdmainutils automake

RUN adduser --uid 1000 --disabled-password --gecos "" user \
	&& chown -R user:user /home/user

USER user
