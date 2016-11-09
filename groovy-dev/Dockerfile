FROM mgg/jvm

USER dev

# ###################################
# ###### INTELLIJ INSTALLATION ######
# ###################################
ENV INTELLIJ_URL=https://download.jetbrains.com/idea/ideaIC-2016.1.4.tar.gz

RUN wget --progress=bar:force $INTELLIJ_URL -O /tmp/intellij.tar.gz \
	&& mkdir -p /home/dev/intellij \
	&& tar -xzf /tmp/intellij.tar.gz -C /home/dev/intellij --strip-components=1 \
	&& rm -rf /tmp/intellij*

RUN echo "alias groovidea='/home/dev/intellij/bin/idea.sh /home/dev/ws/groovy.ipr'" >> /home/dev/.bashrc

RUN mkdir -p /home/dev/.IdeaIC2016.1/config/options && \
    mkdir -p /home/dev/.IdeaIC2016.1/config/plugins

COPY files/jdk.table.xml /home/dev/.IdeaIC2016.1/config/options/jdk.table.xml
