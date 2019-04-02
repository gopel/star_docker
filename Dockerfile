FROM ubuntu:xenial

LABEL base.image="ubuntu:xenial"
LABEL version="1"
LABEL software="STAR"
LABEL software.version="latest"
LABEL description="Spliced Transcripts Alignment to a Reference, Alexander Dobin, 2009-2019"
LABEL website="https://github.com/alexdobin/STAR"
LABEL license="https://github.com/alexdobin/STAR/blob/master/LICENSE"

MAINTAINER Yanis Bendjelal, yanis.bendjelal@polytechnique.edu

RUN apt-get update && apt-get -y install \
	bzip2 \
	gcc \
	gzip \
	wget \
	git \
        make \
	libz-dev \
	build-essential \
	libc6 \
	binutils \
	sed

RUN wget https://github.com/alexdobin/STAR/archive/2.7.0f.tar.gz
RUN tar -xzf 2.7.0f.tar.gz

WORKDIR  /STAR-2.7.0f/source
RUN sed '21d' Makefile
RUN make STAR
ENV PATH="/STAR-2.7.0f/bin/Linux_x86_64:$PATH"


# DEFINE DEFAULT COMMAND
CMD ["STAR"]
