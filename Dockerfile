FROM ghcr.io/linuxserver/code-server:version-v3.9.0
LABEL org.opencontainers.image.source=https://github.com/talltechdude/code-server

# Add Mods
ENV DOCKER_MODS=linuxserver/mods:code-server-docker|linuxserver/mods:code-server-zsh
RUN /bin/bash -c "source /docker-mods"
#ENV DOCKER_MODS=

# Install ZSH
RUN /bin/bash -c "source /etc/cont-init.d/98-zsh"

# Use ZSH
RUN chsh -s /usr/bin/zsh
ENV SHELL=/usr/bin/zsh

# Clone custom content
RUN git clone https://gitlab.com/talltechdude/dotfiles && cd dotfiles && ./install

# ZSH firstrun
#RUN echo "finding zsh" && \
#    /bin/bash -c "which zsh"
#RUN /bin/zsh "ls"
