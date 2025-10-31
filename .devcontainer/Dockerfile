# ============================================
# Size-Optimized Lean 4 Dockerfile with Non-Root User
# Base: debian:bookworm-slim (~70MB)
# Final Size: ~250-300MB
# ============================================

FROM debian:bookworm-slim

# Install minimal required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Required for elan installation
    curl \
    ca-certificates \
    # Required for lake/git dependencies
    git \
    # Required for Lean/Lake build (C/C++ compilers)
    build-essential \
    # Required for devcontainer features (common-utils)
    sudo \
    # Remove cache to reduce size
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set environment variables for elan
# Will be installed per-user by postCreateCommand
ENV ELAN_HOME=/usr/local/elan \
    PATH=/usr/local/elan/bin:$PATH

# Create a shared elan directory that will be accessible to all users
RUN mkdir -p $ELAN_HOME && chmod 777 $ELAN_HOME

# Install elan globally
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf \
    | sh -s -- -y --no-modify-path --default-toolchain none \
    && chmod -R a+w $ELAN_HOME \
    && elan --version

WORKDIR /workspace

# The devcontainer features will create the vscode user automatically
# and match UID/GID with the host user
