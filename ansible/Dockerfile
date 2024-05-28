FROM debian:latest

RUN apt-get update && apt-get install -y \
    ansible \
    openssh-server \
    python3-pip \
    && apt-get clean

RUN mkdir -p /var/run/sshd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

EXPOSE 22

CMD ["/entrypoint.sh"]