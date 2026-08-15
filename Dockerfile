# syntax=docker/dockerfile:1
FROM debian:trixie-slim

ENV USER_NAME="apt"
ENV DEBIAN_FRONTEND="noninteractive"

RUN --mount="type=bind,source=./add-kubectl-sources,target=/tmp/add-kubectl-sources" <<_EOF_
apt-get update
apt-get install \
    --assume-yes \
    --no-install-recommends \
    "ca-certificates" \
    "curl" \
    "jq"

/tmp/add-kubectl-sources
_EOF_

RUN <<_EOF_
groupadd --gid 1000 "${USER_NAME}"
useradd --create-home --uid 1000 --gid 1000 "${USER_NAME}"
_EOF_

WORKDIR "/home/${USER_NAME}"
USER 1000
