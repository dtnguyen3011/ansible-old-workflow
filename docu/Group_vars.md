# Group_vars
What are Group_vars:
A managed node can be in multiple groups. If you create groups named for the function of the nodes in the group, for example `windows sever` or `Linux machine` , your playbooks can target machines based on function.
Actually groupVARS are variable values which are valid for a certain group of hosts. the groups themselves are defined in the inventory.
## Group_vars folder
All host or group specific variables located in the folder `group_vars`.
In the inventory the nodes are grouped in a hirarchical way and that the groups of host which then are referenced in playbooks to run tasks on all children. Group_vars allow you to define certain variable values for different node groups.

Under inventory/ you can copy the template folder and creat a folder with your project name, prepare vars.yml and vault.yml

In the `vars.yml`, define all of the variables needed, including any sensitive ones are referenced to values from the encrypted vault.yml.
In the `vault.yml` you can save sensitive variables like password, jenkins_api_key, ssh_key etc. And encrypt the vault file to protect its contents.
More introduction about the vars and vault can be found here: [https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#keep-vaulted-variables-safely-visible](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#keep-vaulted-variables-safely-visible)

The win_10.yml, win_winServer.yml etc. contain pre-defined node settings, which handle the ansible connection settings based on the OS (win10, windows server and linux). 
For win10 machine you need set up openssh and use ssh (username+password) for connection.
For windows Server ansible use WinRM to connected to the managed Node.
For Linux ansible use SSH to connected to the managed Node.


## Ansible vault
Encryption of sensitive date like passwords can be done using [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html).
After you save the sensitive variables (password, ssh etc) in the `vault.yml`, you can call the following command to encrypt the vault.yml:
```bash
ansible-vault encrypt inventory/your project(RA5)/group_vars/all/vault.yml
```
You will be asked to give a initial password, please remember this password. After giving twice password, `vault.yml` will be encrypted. For your systemuser you have a user_password, and in ansible in order to encrypt this user_password, you also have a key password to encrypt. This password is different from your user_password and is saved on your local computer only.
You can save this key password in a file under your local pc, here i will name this file as vauldID. 
```bash
nano ~/.vaultId
```
Paste your initial password here and save it. 
Later on everytime when you call the ansible command you can give command like following, ansible can decryped the vault.yml.

```bash
ansible-playbook playbooks/Radar5_win10_ecu.yml  --vault-id ~/.vaultId -i inventory/inventory_Radar5.yml
```