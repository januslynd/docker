FROM debian:jessie

# ##################################
# ###### ADDING EXTRA SOURCES ######
# ##################################

COPY files/extra-sources.list /extra-sources.list
RUN cat /extra-sources.list >> /etc/apt/sources.list

# ##################################
# ######## INSTALLING UTILS ########
# ##################################

RUN apt-get update && \
    apt-get install -t stable -yq \
    tmux \
    sudo \
    vim \
	unzip \
    xz-utils \
    curl \
    rlwrap \
    imagemagick

# ##################################
# ###### OCR RELATED SOFTWARE ######
# ##################################

RUN apt-get install -t unstable -yq \
    hunspell-es \
    hunspell-en-us \
    hunspell-en-gb \
    tesseract-ocr \
    tesseract-ocr-spa \
    tesseract-ocr-eng

# ##################################
# ####### USER CONFIGURATION #######
# ##################################

RUN echo "dev ALL=(ALL) PASSWD:ALL" >> /etc/sudoers && \
    useradd dev -d /home/dev -s /bin/bash && \
    cp -r /etc/skel /home/dev && \
    chown dev -R /home/dev

RUN echo 'dev:devpassword123' | chpasswd

# ##################################
# ####### STARTUP WORKDIR ##########
# ##################################

USER dev
WORKDIR /home/dev

CMD tmux
