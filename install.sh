#!/bin/sh -ue

DIST=""

set +e
if [[ -r "/etc/lsb-release" ]]; then
  DIST="ubuntu"
elif [[ -r "/etc/debian_version" ]]; then
  DIST="debian"
elif [[ -r "/etc/redhat-release" ]]; then
  DIST="redhat"
elif [[ -r "/etc/alpine-release" ]]; then
  DIST="alpine"
else
  exit 1
fi
set -e

if [[ ${DIST} = "ubuntu" ]] || [[ ${DIST} = "debian" ]]; then
  apt-get update && apt-get install -y python python-pip gcc
elif [[ ${DIST} = "redhat" ]]; then
  yum install -y epel-release && yum install -y python python-pip gcc
elif [[ ${DIST} = "alpine" ]]; then
  apk add --no-cache python-dev py-pip gcc musl-dev
fi

pip install --upgrade pip setuptools
pip install ansible-container[docker]
