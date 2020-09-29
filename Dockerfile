FROM openjdk:16-alpine

# Install Bash, cURL and clean up APK
RUN apk add --no-cache curl bash && \
    rm -vrf /var/cache/apk/*
# Create User and Group
ENV USER=docker
ENV _UID=12345
ENV _GID=23456
RUN mkdir /cli && \
    addgroup --gid "$_GID" --system "$USER" && \
    adduser --disabled-password --gecos "" --home /cli \
    --ingroup "$USER" --uid "$_UID" "$USER" && \
    chown $USER:$USER /cli
# Changing workdir
WORKDIR /cli
# Changing user
USER docker
# Install Jelastic CLI
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash
# Copy entrypoint
ADD entrypoint.sh /cli/entrypoint.sh
ENTRYPOINT ["/cli/entrypoint.sh"]
