FROM debian:latest

RUN apt-get update && apt-get install -y \
    systemd \
    systemd-sysv \
    dbus \
    openssh-server \
    python3-pip \
    && apt-get clean

RUN mkdir -p /var/run/sshd && chmod 700 /root/.ssh

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

COPY ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 22

CMD ["/lib/systemd/systemd"]