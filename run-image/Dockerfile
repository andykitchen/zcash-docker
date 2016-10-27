FROM ubuntu:trusty

RUN apt-get update && apt-get -y install libgomp1

RUN adduser --uid 1000 --disabled-password --gecos "" user \
	&& chown -R user:user /home/user

ADD zcash-cli /usr/local/bin
ADD zcashd /usr/local/bin

USER user
