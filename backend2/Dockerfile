FROM debian:latest

RUN apt-get update && apt-get install -y \
    openssh-server \
    python3-pip \
    && apt-get clean

RUN mkdir /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
    
    # Добавление публичного ключа в authorized_keys
COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
    
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

COPY index.html /var/www/html/index.html

EXPOSE 22

CMD ["sh", "-c", "service ssh start && tail -f /dev/null"]