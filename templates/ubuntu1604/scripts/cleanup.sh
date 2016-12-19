#!/bin/bash

unset HISTFILE

#cleanup authorized keys
sudo rm ~/.ssh/authorized_keys

echo "cleanup logs"
sudo rm /var/log/cloud-init-output.log