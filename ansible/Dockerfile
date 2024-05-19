# Using python for ansible 
FROM python:3.9

# install pachage 
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

