#!/bin/sh
# To add repository script

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt update
${SUDO} apt ugrade -y
${SUDO} apt -y install apt-transport-https lsb-release ca-certificates curl
${SUDO} curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt update
${SUDO} apt -y install php