#!/bin/sh

echo "$VAULT_PASS" > ~/.vault_pass.txt
mkdir ~/.ssh
ansible-vault view --vault-password-file=~/.vault_pass.txt vars/ssh_key > ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa

ansible-playbook --vault-password-file ~/.vault_pass.txt -i hosts/hosts.tml main.yml