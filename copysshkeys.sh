#!/bin/bash

if [[ $# -ne 1 ]]; then
        echo "Usage: copysshkeys.sh <user>"
        exit 2
fi

if id "$1" &>/dev/null; then
    echo "User $1 found. Copying keys"
else
    echo "User $1 not found"
    exit 2
fi

mkdir /home/$1/.ssh
chmod 700 /home/$1/.ssh
cp /root/.ssh/authorized_keys /home/$1/.ssh/authorized_keys
chmod 600 /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
