Here is short runbook about automate environment stup for sessions: 7/8

# Ping/Pong
ansible s-wr -m ping -i inventory/hosts

# Delete all lab containers and all stuff
ansible-playbook -i inventory/hosts cleanup.yml

# Do all requisite steps
ansible-playbook -i inventory/hosts prepare.yml

# Create all lab containers
ansible-playbook -i inventory/hosts create.yml

# Implement init configuration for grafana and prometheus
ansible-playbook -i inventory/hosts initialize.yml
