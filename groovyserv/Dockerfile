FROM openjdk:8-jdk-slim

## INSTALL DEPENDENCIES
RUN apt-get update -yq && \
    apt-get install -yq \
    --no-install-recommends \
    unzip \
    curl \
    sudo

## VARIABLES
ENV DISPLAY=:10
ENV GROOVY_PATH=/home/groovyuser/groovy
ENV GROOVY_VERSION=2.4.12
ENV GROOVYSERV_VERSION=1.1.0
ENV GROOVY_HOME=$GROOVY_PATH/groovy-$GROOVY_VERSION
ENV GROOVYSERV_PATH=/home/groovyuser/groovyserv
ENV GROOVY_SERVER=$GROOVYSERV_PATH/groovyserv-$GROOVYSERV_VERSION
ENV PATH=$PATH:$GROOVY_HOME/bin:$GROOVY_SERVER/bin
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m "

# Add dev user
RUN useradd groovyuser -d /home/groovyuser -s /bin/bash && \
    cp -r /etc/skel /home/groovyuser && \
    chown groovyuser:groovyuser -R /home/groovyuser/ && \
    echo "groovyuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER groovyuser
WORKDIR /home/groovyuser

## GROOVY
RUN curl \
    -L  https://dl.bintray.com/groovy/maven/apache-groovy-binary-$GROOVY_VERSION.zip\
    --output /tmp/apache-groovy-binary-$GROOVY_VERSION.zip && \
    mkdir -p $GROOVY_PATH && \
    unzip /tmp/apache-groovy-binary-$GROOVY_VERSION.zip -d $GROOVY_PATH && \
    rm /tmp/apache-groovy-binary-$GROOVY_VERSION.zip

## GROOVYSERV
RUN curl \
    -L https://bitbucket.org/kobo/groovyserv-mirror/downloads/groovyserv-$GROOVYSERV_VERSION-bin.zip \
    --output /tmp/groovyserv.zip && \
    mkdir -p $GROOVYSERV_PATH/log && \
    mkdir -p $GROOVYSERV_PATH/work && \
    unzip /tmp/groovyserv.zip -d $GROOVYSERV_PATH/ && \
    rm /tmp/groovyserv.zip

## CLEANING UP
USER root
RUN apt-get remove -y curl && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

## ENTRYPOINT
USER groovyuser
COPY files/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
