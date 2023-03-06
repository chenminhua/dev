### on mac

```sh
brew install ansible

# run a command
ansible all --inventory "localhost," --module-name debug --args "msg='Hello Ansible'"
# equals to
ansible all -i "localhost," -m debug -a "msg='Hello Ansible'"
```

ansible-inventory --graph


## what is ansible

- Comparable solutions are:
  - puppet
  - chef
  - saltstack
- manage configuration as code (YAML playbooks)

## requirements

- Ansible control node is where the ansible software is installed.
- Managed nodes are assets that are managed with ansible.
- Managed nodes need remote access: ssh is default.
- A dedicated user account, for convenience use the same user account.
- Configured privilege escalation to install software, change config...

## Inventory

- To identify managed hosts
- To define host groups to be used by ansible
- Default inventory is in /etc/ansible/hosts
- Project-based inventory is common, inventory files can be referred to using the -i inventoryfilename

## Ad-hoc commands

- cmdline only solution to perform ansible tasks.
- ansible modules can be used in ad-hoc cmd.
- Recommended to use the most specific module you can find, as generic modules are not idempotent.
- Fully Qualified Collection Name (FQCN) is used, like ansible.builtin.command

- ansible.builtin.command is a generic module that allows you to run any cmd.
- ansible.builtin.shell allows you to run shell features like pipe.
- ansible.builtin.user is a specific module for managing user accounts.
- ansible.builtin.copy is used to copy files.


#### -m and -a

m means module, a means argument

```
ansible az-01  -m ping

ansible az-01 -m command -a uptime
ansible az-01 -a uptime
ansible az-01 -a "free -h"
```

#### -b or --become to get privileged access

```
ansible az-01 -b -a "tail /var/log/syslog"
```

#### -m package to install 

```
ansible az-01 -b -m package -a name=nginx
```