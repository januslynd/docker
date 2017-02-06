FROM debian:jessie

#    ___                        _             _
#   |   \ ___ _ __  ___ _ _  __| |___ _ _  __(_)___ ___
#   | |) / -_) '_ \/ -_) ' \/ _` / -_) ' \/ _| / -_|_-<
#   |___/\___| .__/\___|_||_\__,_\___|_||_\__|_\___/__/
#            |_|
#
RUN apt-get update && apt-get install -yq \
    sudo \
    tmux \
    git \
    vim \
	unzip \
    xz-utils \
    curl \
    nginx-extras \
    openssh-server \
    python \
    rlwrap && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

##################
###### USER ######
##################

RUN echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    useradd dev -d /home/dev -s /bin/bash && \
    cp -r /etc/skel /home/dev && \
    chown dev -R /home/dev

RUN echo 'dev:devpassword123' | chpasswd

##################
####### SSH ######
##################

EXPOSE 22

##################
###### INIT ######
##################

COPY files/entrypoint.sh /home/dev/.bin/
RUN chmod +x /home/dev/.bin/*.sh

WORKDIR /home/dev

USER dev
ENTRYPOINT [".bin/entrypoint.sh"]
