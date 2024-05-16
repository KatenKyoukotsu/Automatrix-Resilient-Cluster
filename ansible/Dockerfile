# Используем образ Python для работы с Ansible
FROM python:3.9

# Устанавливаем зависимости (ansible, docker)
RUN pip install ansible docker

# Копируем плейбуки Ansible и конфигурацию
COPY ansible/ /ansible

# Копируем все Dockerfile в корень контейнера
COPY ./*.Dockerfile /

# Устанавливаем рабочую директорию
WORKDIR /ansible

# Устанавливаем переменные окружения для Ansible (необязательно)
ENV ANSIBLE_HOSTS=/etc/ansible/hosts
ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

