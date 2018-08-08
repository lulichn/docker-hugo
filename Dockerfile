FROM node:alpine

ENV HUGO_VERSION 0.36.1

# Install HUGO
WORKDIR /tmp

RUN set -x \
	&& apk add --no-cache openssl ca-certificates \
	&& update-ca-certificates \
	&& wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz |  tar xvfz - \
	&& mv hugo /usr/bin/hugo


RUN mkdir /data
WORKDIR   /data

ENTRYPOINT ["/usr/bin/hugo"]

