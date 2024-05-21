# Using python for ansible 
FROM debian:latest

# install pachage
ENV DEBIAN_FRONTEND=nonineractive

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python3-pip \ 
    python3-apt


RUN pip install ansible docker


# copy playbook and conf
COPY nodes/ ~/

# install virual environment for Ansimble
ENV ANSIBLE_HOSTS=/etc/ansible/hosts
ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

RUN ansible-galaxy collection install community.docker

RUN mkdir -p /ansible/playbooks 

WORKDIR /ansible/playbooks

COPY ./playbooks /ansible/playbooks

COPY hosts /etc/ansible/hosts

