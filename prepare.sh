#!/bin/bash
yes |ssh-keygen -f key
chmod 600 key

podman build -t ansible-centos .
cd control
podman build -t ansible-control .
cd ..
podman network create ansible

podman run -dt --rm --network=ansible --name server01 ansible-centos
podman run -dt --rm --network=ansible --name server02 ansible-centos

cat << EOF >> inventory.ini
[servers]
server01 ansible_host=`podman inspect -f "{{.NetworkSettings.Networks.ansible.IPAddress}}" server01`
server02 ansible_host=`podman inspect -f "{{.NetworkSettings.Networks.ansible.IPAddress}}" server02`

EOF
podman run -it --rm --network=ansible -v $PWD:/root:z --name control ansible-control
