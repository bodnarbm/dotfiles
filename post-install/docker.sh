#!/bin/sh
# Post-install: Docker CLI plugins

mkdir -p "$HOME/.docker/cli-plugins"
ln -sf /opt/homebrew/opt/docker-compose/bin/docker-compose "$HOME/.docker/cli-plugins/docker-compose"
ln -sf /opt/homebrew/opt/docker-buildx/bin/docker-buildx "$HOME/.docker/cli-plugins/docker-buildx"
