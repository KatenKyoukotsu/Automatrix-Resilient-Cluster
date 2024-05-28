#!/bin/bash

service ssh start

# LB1_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lb1)
# LB2_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lb2)

# tail -f /dev/null

# # Проверяем, что IP-адреса были получены
# if [ -z "$LB1_IP" ] || [ -z "$LB2_IP" ]; then
#   echo "Не удалось получить IP-адреса контейнеров lb1 и lb2"
#   exit 1
# fi

# # Обновляем /etc/hosts
# echo "$LB1_IP lb1" >> /etc/hosts
# echo "$LB2_IP lb2" >> /etc/hosts

# echo "Файл /etc/hosts успешно обновлен"



ssh-keyscan lb1 >> /root/.ssh/known_hosts
ssh-keyscan lb2 >> /root/.ssh/known_hosts

ssh-keyscan backend1 >> /root/.ssh/known_hosts
ssh-keyscan backend2 >> /root/.ssh/known_hosts

ansible-playbook -i ansible/playbooks/inventory ansible/playbooks/playbook_main.yml

tail -f /dev/null