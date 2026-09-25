#!/bin/bash

# 1. Install Docker if not installed
if ! command -v docker >/dev/null 2>&1; then
    sudo dnf install -y docker
    sudo systemctl enable --now docker
fi

# 2. Add current user to docker group
sudo usermod -aG docker "$USER"

# 3. Run existing image
docker stop my-nginx 2>/dev/null || true
docker rm my-nginx 2>/dev/null || true

docker run -d \
    --name my-nginx \
    -p 80:80 \
    my-nginx:1.0
