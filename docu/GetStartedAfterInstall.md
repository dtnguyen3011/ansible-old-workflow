# Get started after Ansible Installing

Hint: When you facing this warning in ansible: Ansible is being running in a word writeable directory. This means some of the file in this repo only have read right and do not have write right:
```bash
export ANSIBLE_CONFIG=<path/to/>ansible.cfg
```
This command can help, and Please make sure you have configured your proxy as described in the documentation of WSL / OSD.
Add these proxy in nano ~/.bashrc, you can find moredetails in step 4.2 - 4.5 in [SetupYourMachine.md](docu/SetupYourMachine.md)

## your first test with ansible on oyur local
Copy the template in the inventory folder and you can prepare a simple inventory on your local computer, use one of your project node.
## Inventory example
```bash
ra5:
  children:
    win:
      hosts:
        ABTSRS**5.de.bosch.com:
```
According to the  Group_vars, set up your `vars.yml` and `vault.yml`
* [Group_vars](docu/Group_vars.md)
By running the playbook `ping_all_nodes`, you can verify your ansible installation and check, if you can connect to your node(s) in the inventory.
```bash
ansible-playbook playbooks/ping_all_nodes.yml --vault-id ~/.vaultId
```




