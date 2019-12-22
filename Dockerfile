FROM alpine:3.11
LABEL maintainer="Chris Kankiewicz <Chris@ChrisKankiewicz.com>"

# Hangoutsbot version
ARG HOB_VERSION=3.0.1

# Create Hangoutsbot directories
RUN mkdir -p /opt/hangoutsbot /etc/hangoutsbot

# Create non-root user
RUN adduser -Ds /sbin/nologin hangoutsbot

# Set Hangoutsbot archive URL
ARG TARBALL_URL=https://api.github.com/repos/hangoutsbot/hangoutsbot/tarball/v${HOB_VERSION}

# Install dependencies, fetch Hangoutsbot archive and chown files
RUN apk add --update ca-certificates gcc git musl-dev python3-dev tar tzdata wget \
    && wget -qO- ${TARBALL_URL} | tar -xz --strip-components=1 -C /opt/hangoutsbot \
    && wget -qO- https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --no-cache-dir --no-use-pep517 -r /opt/hangoutsbot/requirements.txt \
    && apk del --purge gcc git musl-dev tar wget && rm -rf /var/cache/apk/* \
    && chown -R hangoutsbot:hangoutsbot /etc/hangoutsbot /opt/hangoutsbot

# Set running user
USER hangoutsbot

# Set volumes
VOLUME /etc/hangoutsbot

# Set the working dir
WORKDIR /opt/hangoutsbot

# Default command
CMD ["/opt/hangoutsbot/hangupsbot/hangupsbot.py", "--config", "/etc/hangoutsbot/config.json", \
     "--cookies", "/etc/hangoutsbot/cookies.json", "--memory", "/etc/hangoutsbot/memory.json"]
