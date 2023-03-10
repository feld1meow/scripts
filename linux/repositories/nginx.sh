#!/bin/sh
# To add repository and install script

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

${SUDO} apt update
${SUDO} apt ugrade -y
${SUDO} apt -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
${SUDO} curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
${SUDO} echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
${SUDO} echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee /etc/apt/preferences.d/99nginx
${SUDO} apt update
${SUDO} apt -y install nginx