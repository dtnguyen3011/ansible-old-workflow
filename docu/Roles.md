# Roles

What is roles: Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content in roles, you can easily reuse them and share them with other users.
## Re-use of existing roles

It is highly recommended to re-use the [shared roles in the ANSIBLE Project](https://sourcecode01.de.bosch.com/projects/ANSIBLE) instead of implementing and maintaining your own deployment logic.

To add a new role to be used here just add it to  `roles/requirements.yml`.

To install the roles run:

```bash
./playbook-setup.sh
```

In case you require additional deployment logic please think about contributing and sharing in the [shared ANSIBLE Project](https://sourcecode01.de.bosch.com/projects/ANSIBLE) so others can re-use.

## Roles example
1. there are plenty of roles that are available, we can directly using them, by using this ansible-galaxy role install to install the roles you want, before running this command, you need to make sure the reuirements.yml is available.
```bash
ansible-galaxy role install -f -r roles/requirements.yml
```
2. the reuirements.yml define where you can download the roles packages:
3. in the ansible cfg, you can define where you want to save your roles package.
4. after running the ansible-galaxy role install success, you will get the roles installed on your own local pc. (and as in last step said, in the ansible.cfg, you can define the path where you save your download role package.)
5. 
A small example test for the roles can be found in this wiki: [https://inside-docupedia.bosch.com/confluence/x/TtthZg](https://inside-docupedia.bosch.com/confluence/x/TtthZg)