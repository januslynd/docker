FROM base/archlinux

# INSTALL DEPENDENCIES
RUN pacman -Syyu --noconfirm && \
    pacman --noconfirm -Syy \
    firefox \
    unzip \
    go \
    jdk8-openjdk \
    xorg-server-xvfb

# VERSIONS
ENV GECKO_DRIVER=0.19.0
ENV GROOVY_VERSION=2.4.12
ENV GROOVYSERV_VERSION=1.1.0

# GECKO_DRIVER
ENV GECKO_PATH /opt/geckodriver/
RUN curl \
    -L https://github.com/mozilla/geckodriver/releases/download/v${GECKO_DRIVER}/geckodriver-v${GECKO_DRIVER}-linux64.tar.gz \
    --output /tmp/geckodriver-${GECKO_DRIVER}.tar.gz

RUN mkdir -p $GECKO_PATH
RUN tar xf /tmp/geckodriver-${GECKO_DRIVER}.tar.gz -C $GECKO_PATH

# GROOVY
RUN curl \
    -L  https://dl.bintray.com/groovy/maven/apache-groovy-binary-$GROOVY_VERSION.zip\
    --output /tmp/apache-groovy-binary-$GROOVY_VERSION.zip

RUN mkdir -p /opt/groovy/
RUN unzip /tmp/apache-groovy-binary-$GROOVY_VERSION.zip -d /opt/groovy/

# GROOVYSERV
RUN curl \
    -L https://bitbucket.org/kobo/groovyserv-mirror/downloads/groovyserv-$GROOVYSERV_VERSION-src.zip \
    --output /tmp/groovyserv.zip

RUN mkdir -p /opt/groovyserv/
RUN mkdir -p /opt/groovyserv/auth
RUN unzip /tmp/groovyserv.zip -d /tmp/
RUN cd /tmp/groovyserv-$GROOVYSERV_VERSION/ && ./gradlew clean distLocalBin
RUN unzip /tmp/groovyserv-$GROOVYSERV_VERSION/build/distributions/groovyserv-$GROOVYSERV_VERSION-bin-local.zip \
    -d /opt/groovyserv/

# GENERAL ENVIRONMENT
ENV DISPLAY=:10
ENV GROOVY_HOME=/opt/groovy/groovy-$GROOVY_VERSION
ENV GROOVY_SERVER=/opt/groovyserv/groovyserv-$GROOVYSERV_VERSION
ENV PATH=$PATH:$GROOVY_HOME/bin:$GROOVY_SERVER/bin:$GECKO_PATH
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Dwebdriver.gecko.driver=/opt/geckodriver/geckodriver -Djava.awt.headless=true -Xmx512m "

COPY files/entrypoint.sh /
RUN chmod +x /entrypoint.sh

# ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
