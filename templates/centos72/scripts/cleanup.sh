#!/bin/bash

unset HISTFILE

echo "Remove SSH host keys"
rm -f /etc/ssh/ssh_host*key*

echo "cleanup logs"
sudo rm /var/log/cloud-init-output.log