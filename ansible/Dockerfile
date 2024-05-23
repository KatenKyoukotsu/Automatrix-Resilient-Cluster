FROM debian:latest
RUN apt-get update && apt-get install -y ansible sshpass
COPY ./playbooks /ansible/playbooks
CMD ["sleep", "infinity"]
