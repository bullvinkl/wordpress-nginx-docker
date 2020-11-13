#! /bin/bash

##Установка Docker
dnf -y install -y yum-utils device-mapper-persistent-data lvm2
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf -y install docker-ce --nobest
usermod -aG docker $(whoami)
newgrp docker
systemctl enable --now docker

##становка Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --reload

mkdir -p certs/ certs-data/ logs/nginx/ mysql/ wordpress
