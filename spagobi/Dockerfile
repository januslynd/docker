FROM openjdk:8

#    ___                        _             _
#   |   \ ___ _ __  ___ _ _  __| |___ _ _  __(_)___ ___
#   | |) / -_) '_ \/ -_) ' \/ _` / -_) ' \/ _| / -_|_-<
#   |___/\___| .__/\___|_||_\__,_\___|_||_\__|_\___/__/
#            |_|
#
RUN apt-get update && apt-get install -yq \
    sudo \
    openjfx \
    tmux \
    vim \
	unzip \
    xz-utils \
    curl \
    rlwrap \
	postgresql-client && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

#    _   _
#   | | | |___ ___ _ _
#   | |_| (_-</ -_) '_|
#    \___//__/\___|_|
#

RUN echo "dev ALL=(ALL) PASSWD:ALL" >> /etc/sudoers && \
    useradd dev -d /home/dev -s /bin/bash && \
    cp -r /etc/skel /home/dev && \
    chown dev -R /home/dev

RUN echo 'dev:devpassword123' | chpasswd

#    ___           _      _                      _
#   | _ ) ___  ___| |_ __| |_ _ _ __ _ _ __ _ __(_)_ _  __ _
#   | _ \/ _ \/ _ \  _(_-<  _| '_/ _` | '_ \ '_ \ | ' \/ _` |
#   |___/\___/\___/\__/__/\__|_| \__,_| .__/ .__/_|_||_\__, |
#                                     |_|  |_|         |___/
#
# Setting default workdir, exposing most common ports and executing
# tmux
#
ENV HOME_BIN /home/dev/.bin

COPY files/entrypoint.sh /home/dev/.bin/
COPY files/tmux.conf /home/dev/.tmux.conf
COPY files/spagobi.zip /home/dev/

RUN unzip /home/dev/spagobi.zip -d /home/dev/
RUN mv /home/dev/All-In-One-* /home/dev/spagobi
RUN ls /home/dev/spagobi
RUN chmod +x /home/dev/spagobi/**/*.sh
RUN chmod +x /home/dev/.bin/*.sh

RUN sed -i -- 's/8080/7070/g' /home/dev/spagobi/conf/server.xml
RUN sed -i -- 's/8443/7443/g' /home/dev/spagobi/conf/server.xml
RUN sed -i -- 's/8005/7005/g' /home/dev/spagobi/conf/server.xml
RUN sed -i -- 's/8009/7009/g' /home/dev/spagobi/conf/server.xml

WORKDIR /home/dev/spagobi/

ENTRYPOINT ["/home/dev/.bin/entrypoint.sh"]
