#!/bin/sh
# To add repository script

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt update
${SUDO} apt ugrade -y
${SUDO} mkdir -p -m 700 ~/.gnupg
${SUDO} gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
${SUDO} chmod 644 /tmp/onlyoffice.gpg
${SUDO} chown root:root /tmp/onlyoffice.gpg
${SUDO} mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
${SUDO} echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
${SUDO} apt update
${SUDO} apt -y install onlyoffice-desktopeditors