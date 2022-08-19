# ansible-lab
Dockerized ansible-lab

# Prepare environment

./prepare.sh

As the result you will be logged in inside control node shell

# Testing ansible setup

```
ansible -i inventory.ini all -m ping
server02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
server01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}
```

# Retire lab
./retire.sh

# Credentials
https://github.com/ansible/test-playbooks 
