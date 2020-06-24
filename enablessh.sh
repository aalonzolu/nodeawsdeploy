#!/bin/bash
eval $(ssh-agent -s)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo $1;
echo "echoed key"
if [ -z "$1" ]
  then
    echo "No ssh key spesified, generating..."
    HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P "" && cat ~/.ssh/id_rsa.pub
  else
    echo "$1" >~/.ssh/id_rsa
    echo "Key loaded"
    chmod 600 ~/.ssh/id_rsa
    ls -lah ~/.ssh
    ssh-add ~/.ssh/id_rsa
fi

