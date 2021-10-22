FROM node:16-bullseye

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        less \
        man \
    && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/workdir
VOLUME ["/opt/workdir"]

# Install webpack so we can run that without installing it in ./node_modules.
RUN npm install -g webpack webpack-cli

# Don't let the node image semi-magically supply `node` to some commands.
ENTRYPOINT []

# Run as some user besides root.
USER node

# TODO: Really the `plonk` script ought to run is with the real host's uid:gid,
# so the files are read from/written to the mounted volumes as the runner of the
# `docker` command but TK TK
