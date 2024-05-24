FROM debian:latest
RUN apt-get update && apt-get install -y ansible pacemaker pcs corosync openssh-server sudo sshpass nginx apache2 python3-pip python3-passlib
COPY ./playbooks /ansible/playbooks

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN mkdir /var/run/sshd  # Создание необходимой директории
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config

# Отключение строгих проверок ключей для упрощения подключений к серверу
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

COPY ssh/* /root/.ssh/

CMD ["/entrypoint.sh"]
# CMD ["ansible-playbook", "/ansible/playbooks/playbook_main.yml"]
# RUN ansible-playbook /ansible/playbooks/playbook_main.yml