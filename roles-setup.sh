#!/bin/bash

# Get Ansible roles
# ansible-galaxy role install -f -r "$(dirname $0)/roles/requirements.yml"
ansible-galaxy role install -f -r roles/requirements.yml
