#!/bin/bash
podman stop server01
podman stop server02
podman rmi ansible-control
podman rmi ansible-centos
rm -rf .ssh
rm key key.pub
rm -rf .ansible
rm inventory.ini
