#!/bin/bash

# Запускаем SSH сервис
service ssh start

# Добавляем ключи узлов lb1 и lb2 в known_hosts
ssh-keyscan lb1 >> /root/.ssh/known_hosts
ssh-keyscan lb2 >> /root/.ssh/known_hosts

# Добавляем ключи узлов backend1 и backend2 в known_hosts
ssh-keyscan backend1 >> /root/.ssh/known_hosts
ssh-keyscan backend2 >> /root/.ssh/known_hosts

# Запускаем Ansible playbook
ansible-playbook -i ansible/playbooks/inventory ansible/playbooks/playbook_main.yml

# Удерживаем контейнер в активном состоянии
tail -f /dev/null
