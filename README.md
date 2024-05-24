# Automatrix-Resilient-Cluster

# Шаг 1: Создание SSH ключей

На хосте создайте SSH ключи, если они еще не созданы:

```
ssh-keygen -t rsa -b 4096 -f ./ssh/id_rsa -N ""
```

# Шаг 2: Копирование публичного ключа

Скопируйте созданный публичный ключ в директории контейнеров `backend1`, `backend2`, `lb1`, `lb2`.

```
cp ./ssh/id_rsa.pub ./backend1/
cp ./ssh/id_rsa.pub ./backend2/
cp ./ssh/id_rsa.pub ./lb1/
cp ./ssh/id_rsa.pub ./lb2/
```

# Шаг 3: Запуск Docker Compose

Теперь, когда публичные ключи добавлены в соответствующие директории, запустите Docker Compose:

```
docker-compose up --build
```

# Шаг 4: Запуск Ansible Playbooks

Подключитесь к контейнеру `ansible` и выполните плейбук для копирования SSH ключей:

```
docker exec -it ansible /bin/bash
ansible-playbook /ansible/playbooks/playbook_copy_ssh.yml
```

Запустите основной плейбук:

```
ansible-playbook /ansible/playbooks/playbook_main.yml
```

Настройте балансировщики:

```
ansible-playbook /ansible/playbooks/playbook_conf-lb.yml
```

Настройте кластер Pacemaker:

```
ansible-playbook /ansible/playbooks/playbook_conf-cluster-lb.yml
```

Настройте бэкенды:

```
ansible-playbook /ansible/playbooks/playbook_conf-backend.yml
```

Эти шаги должны обеспечить корректную настройку и работу системы.