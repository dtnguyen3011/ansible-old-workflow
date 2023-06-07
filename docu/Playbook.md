# Playbook
### Use a playbook

What is a playbook: 
A playbook connects `Roles` to machines in the `Inventory` to configure "What" is done on "Which" machines. Playbooks are records and execute Ansible's configuration, deployment and describe the steps you want to run on your managed nodes. Playbooks are kind of your instruction manuals, ansible manages the nodes by following the playbooks. 

The Machines in Playbook are grouped in a hirarchical way and the groups of host in the playbook run tasks on all children.

### Running a Playbook

Usage of ansible playbooks is documented well in the official guides by Ansible, [see here](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html). As quick start, you need to call the `ansible-playbook` utility along with the desired playbook.

```bash
ansible-playbook <playbook_name>
```

```bash
ansible-playbook playbooks/ping_jenkins_agents.yml -i inventory/Radar5/inventory.yml --vault-id ~/.vaultId
```


As a general guide the following arguments are recommended:

Argument   | Description
---------- | -----------
-k         | Ask for the `ssh` password.
-K         | Ask for the `sudo` password for the remote host
-l         | Limit the hosts to a subset of the defined hosts in the playbook. This call also accepts regular expressions
-vvv       | Very verbose mode, good for debuging. Not recommended for productive use.
--vault-id | Path to  the file to your ansible-vault secret

#### ansible-playbook command examples

ansible-playbook -l "linux" -k playbooks/ping_all_machines.yml
```

<ins>Bare run:</ins>
```bash
ansible-playbook -k --limit "some_group" --vault-id @~/.vaultpw <playbook>
```

<ins>With special tag(s):</ins>
```bash
ansible-playbook -k --limit "some_group" --tags "sometag, someothertag" --vault-id @~/.vaultpw <playbook>
```

<ins>With extra vars for e.g. login
```bash
ansible-playbook -k --limit "some_group" --extra-var "auser=bla9abt" --tags "sometag, someothertag" --vault-id @~/.vaultpw <playbook>
```
