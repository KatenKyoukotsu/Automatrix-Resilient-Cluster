FROM debian:latest
RUN apt-get update && apt-get install -y nginx pcs pacemaker corosync openssh-server
RUN mkdir /var/run/sshd
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["sh", "-c", "service ssh start && nginx -g 'daemon off;'"]
