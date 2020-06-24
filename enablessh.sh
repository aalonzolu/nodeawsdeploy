#!/bin/bash
eval $(ssh-agent -s)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "$1";
echo "echoed key"

if [[ -z "${SSH_PRIVATE_KEY}" ]]; then
  echo "no ssh key provided, generating"
  HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P "" && cat ~/.ssh/id_rsa.pub
else
  echo  "ssh key exist"
    echo "$SSH_PRIVATE_KEY" >~/.ssh/id_rsa
    echo "Key loaded"
    chmod 600 ~/.ssh/id_rsa
    ls -lah ~/.ssh
    ssh-add ~/.ssh/id_rsa
fi

