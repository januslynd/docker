FROM openjdk:8-jdk-slim

## INSTALL DEPENDENCIES
RUN apt-get update -yq && \
    apt-get install -yq \
    --no-install-recommends \
    firefox-esr \
    unzip \
    curl \
    xvfb

## VARIABLES
ENV DISPLAY=:10
ENV GECKO_DRIVER=0.19.0
ENV GECKO_PATH=/opt/geckodriver/
ENV GROOVY_VERSION=2.4.12
ENV GROOVYSERV_VERSION=1.1.0
ENV GROOVY_HOME=/opt/groovy/groovy-$GROOVY_VERSION
ENV GROOVY_SERVER=/opt/groovyserv/groovyserv-$GROOVYSERV_VERSION
ENV PATH=$PATH:$GROOVY_HOME/bin:$GROOVY_SERVER/bin:$GECKO_PATH
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Dwebdriver.gecko.driver=/opt/geckodriver/geckodriver -Djava.awt.headless=true -Xmx512m "

## GECKO_DRIVER
RUN curl \
    -L https://github.com/mozilla/geckodriver/releases/download/v${GECKO_DRIVER}/geckodriver-v${GECKO_DRIVER}-linux64.tar.gz \
    --output /tmp/geckodriver-${GECKO_DRIVER}.tar.gz && \
    mkdir -p $GECKO_PATH && \
    tar xf /tmp/geckodriver-${GECKO_DRIVER}.tar.gz -C $GECKO_PATH && \
    rm /tmp/geckodriver-${GECKO_DRIVER}.tar.gz

## GROOVY
RUN curl \
    -L  https://dl.bintray.com/groovy/maven/apache-groovy-binary-$GROOVY_VERSION.zip\
    --output /tmp/apache-groovy-binary-$GROOVY_VERSION.zip && \
    mkdir -p /opt/groovy/ && \
    unzip /tmp/apache-groovy-binary-$GROOVY_VERSION.zip -d /opt/groovy/ && \
    rm /tmp/apache-groovy-binary-$GROOVY_VERSION.zip

## GROOVYSERV
RUN curl \
    -L https://bitbucket.org/kobo/groovyserv-mirror/downloads/groovyserv-$GROOVYSERV_VERSION-bin.zip \
    --output /tmp/groovyserv.zip && \
    mkdir -p /opt/groovyserv/auth && \
    unzip /tmp/groovyserv.zip -d /opt/groovyserv/ && \
    rm /tmp/groovyserv.zip

## CLEANING UP
RUN apt-get remove -y curl && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

## ENTRYPOINT
COPY files/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
