FROM debian:jessie

##################
## DEPENDENCIES ##
##################

RUN apt-get update && \
    apt-get install -yq software-properties-common

RUN add-apt-repository "deb http://ftp.de.debian.org/debian jessie-backports main" && \
    add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" && \
    apt-get update && \
    apt-get install -yq wget curl sudo openssh-client ansible tmate

##################
###### USER ######
##################

RUN echo "dev ALL=(ALL) PASSWD:ALL" >> /etc/sudoers && \
    useradd dev -d /home/dev -s /bin/bash && \
    cp -r /etc/skel /home/dev && \
    chown dev -R /home/dev

RUN echo 'dev:devpassword123' | chpasswd

##################
## ENVIRONMENT ###
##################

# Setting default workdir, exposing most common ports and executing
# tmux
#
ENV HOME_BIN /home/dev/.bin

COPY files/entrypoint.sh /home/dev/.bin/
COPY files/tmux.conf /home/dev/.tmux.conf
RUN chmod +x /home/dev/.bin/*.sh

USER dev

WORKDIR /home/dev
ENTRYPOINT [".bin/entrypoint.sh"]
