#!/bin/sh
# To add repository and install script

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt update
${SUDO} apt ugrade -y
${SUDO} apt -y install apt-transport-https lsb-release ca-certificates
${SUDO} sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
${SUDO} wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
${SUDO} apt update
${SUDO} apt -y install postgresql