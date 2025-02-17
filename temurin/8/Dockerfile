FROM eclipse-temurin:8-jdk-noble

# Metadata
LABEL author="Minestar" maintainer="developer@minestar.com.ua"
LABEL org.opencontainers.image.source="https://github.com/minestarua/pterodactyl-images"
LABEL org.opencontainers.image.licenses="MIT"

# Installing necessary packages
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 libstdc++6 lsof build-essential tzdata iproute2 locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container container \
    && locale-gen en_US.UTF-8

# Setting up the locales
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Define the container user
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
