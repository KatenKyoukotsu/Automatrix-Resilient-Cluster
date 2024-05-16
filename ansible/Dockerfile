# Using python for ansible 
FROM python:3.9

# install pachage 
RUN pip install ansible docker

# copy playbook and conf
COPY ansible/ /ansible

# copy all Dockerfile 
COPY ./*.Dockerfile /

# Apply working directory 
WORKDIR /ansible

# install virual environment for Ansimble
ENV ANSIBLE_HOSTS=/etc/ansible/hosts
ENV ANSIBLE_CONFIG=/ansible/ansible.cfg

