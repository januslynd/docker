FROM debian:stretch-slim

ENV OMNIDB_VERSION 2.8.0

COPY entrypoint.sh /

RUN apt-get update && apt-get install -yq \
	unzip \
    xz-utils \
    curl \
    rlwrap && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L https://omnidb.org/dist/${OMNIDB_VERSION}/omnidb-server_${OMNIDB_VERSION}-debian-amd64.deb -o omni.deb
RUN dpkg -i omni.deb

ENTRYPOINT ["/entrypoint.sh"]
