# Automatrix-Resilient-Cluster

# Шаг 1: Скопируйте приватный SSH-ключ в контейнер ansible

# На хостовой машине скопируйте приватный ключ в контейнер ansible. Предположим, что ваш приватный ключ находится в ~/.ssh/id_rsa:
```
sh

docker cp ~/.ssh/id_rsa ansible:/root/.ssh/id_rsa
```

# Внутри контейнера выполните следующие команды:
```
sh

chown root:root /root/.ssh/config
chmod 600 /root/.ssh/config
chown root:root /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chown root:root /root/.ssh/id_rsa.pub
chmod 644 /root/.ssh/id_rsa.pub
```

# Запустите плейбук снова

# После исправления прав доступа попробуйте запустить плейбук снова:
```
sh

ansible-playbook /ansible/playbooks/playbook_copy_ssh.yml
```

# Проверка прав доступа на файлы SSH

# Убедитесь, что права доступа на файлы SSH установлены правильно:
```
sh

ls -l /root/.ssh/
```
# Вы должны увидеть что-то похожее на это:
```
sh

-rw------- 1 root root  xxx date time config
-rw------- 1 root root  xxx date time id_rsa
-rw-r--r-- 1 root root  xxx date time id_rsa.pub
```

# Шаг 1: Подключение к контейнеру ansible

Подключитесь к контейнеру `ansible`:

```
sh
docker exec -it ansible /bin/bash
```

# Шаг 2: Копирование SSH ключей в контейнеры

Запустите плейбук для копирования SSH ключей в контейнеры:

```
sh
ansible-playbook /ansible/playbooks/playbook_copy_ssh.yml
```

# Шаг 3: Проверка доступности хостов

Запустите основной плейбук для проверки доступности хостов:

```
sh
ansible-playbook /ansible/playbooks/playbook_main.yml
```

# Шаг 4: Настройка балансировщиков

Запустите плейбук для установки и настройки балансировщиков:

```
sh
ansible-playbook /ansible/playbooks/playbook_conf-lb.yml
```

# Шаг 5: Настройка кластера Pacemaker

Запустите плейбук для установки и настройки кластера Pacemaker:

```
sh
ansible-playbook /ansible/playbooks/playbook_conf-cluster-lb.yml
```

# Шаг 6: Настройка бэкендов

Запустите плейбук для установки и настройки бэкендов:

```
sh
ansible-playbook /ansible/playbooks/playbook_conf-backend.yml
```

# Проверка системы

После выполнения всех этих шагов система должна быть настроена и работать корректно. Вы можете проверить работу, перейдя по URL-адресу балансировщика (например, `http://<IP_балансировщика>`), чтобы убедиться, что балансировка работает и страницы бэкендов отображаются корректно.