#!/bin/bash
podman stop server01
podman stop server02
podman rmi ansible-control
podman rmi ansible-centos
podman rm server01
podman rm server02
podman rm control
podman network rm ansible
rm -rf .ssh
rm key key.pub
rm -rf .ansible
rm inventory.ini
