FROM phusion/baseimage:0.9.19

ENV \
	DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /

# Build the base container
RUN \
	echo "*** Install required packages ***" \
	&& apt-get update \
	&& apt-get install --yes --fix-broken --no-install-recommends $(cat requirements.txt)

ADD root /

ENTRYPOINT [ "/bitbake" ]
