#!/bin/bash
eval $(ssh-agent -s)
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp ~/ssh_config ~/.ssh/config
if [[ -z "${SSH_PRIVATE_KEY}" ]]; then
  HOSTNAME=`hostname` ssh-keygen -t rsa -C "$HOSTNAME" -f "$HOME/.ssh/id_rsa" -P ""
else
    echo "$SSH_PRIVATE_KEY" >~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    ssh-add ~/.ssh/id_rsa
fi

