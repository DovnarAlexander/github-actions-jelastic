FROM alpine:3.13.5
# Labels
LABEL maintainer="dovnar.alexander@gmail.com"
# ENV Vars
ENV JQ_OUTPUT="true"
ENV HOME=/cli
ENV OUTPUT=$HOME/output.log
# Install Bash, cURL and clean up APK
RUN apk add --no-cache curl=~7.76 bash=~5.1 jq=~1.6 openjdk11~11.0 && \
    rm -vrf /var/cache/apk/*
# Create User and Group
ENV USER=docker
ENV _UID=12345
ENV _GID=23456
RUN mkdir $HOME && \
    addgroup --gid "$_GID" --system "$USER" && \
    adduser --disabled-password --gecos "" --home $HOME \
    --ingroup "$USER" --uid "$_UID" "$USER" && \
    chown $USER:$USER $HOME
# Changing workdir
WORKDIR $HOME
# Changing user
USER docker
# Enable Pipefail
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install Jelastic CLI
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash
# Copy entrypoint
ADD --chown=$USER:$USER files/entrypoints/* $HOME/
ENTRYPOINT ["/cli/entrypoint.sh"]
