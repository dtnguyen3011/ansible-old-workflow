# Inventory

What is Inventory: 
Ansible works against multiple managed nodes or “hosts” in your infrastructure at the same time, using a list or group of lists known as inventory. Once your inventory is defined, you use patterns to select the hosts or groups you want Ansible to run against. The nodes can be linux machines, win10, windows sever etc.
## Inventory setup

All known hosts are maintained in the `inventory` file located under inventory folder. This file is defined in an `yml` format.

To maintain some kind of overview, the inventory is split into two sections, the actual inventory located in the file `inventory` and all host or group specific variables located in the folder `group_vars`.
The nodes are grouped in a hirarchical way and that the groups of host are referenced in playbucks to run tasks on all children.

You can create different inventory for different project. By giving -i you can define which inventory you want to call.

You can use the template folder rename it to your own project and under inventory/ ,  define the parameter in vars.yml and vault.yml. Please make sure that under this inventory/ folder the group_vars folder should be included.

