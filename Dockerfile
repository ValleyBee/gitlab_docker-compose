FROM centos:stream8
LABEL MAINTAINER Valentyn 'valley@mail.ru'
RUN yum update -y

RUN yum install -y curl policycoreutils-python openssh-server openssh-clients perl
# Enable OpenSSH server daemon if not enabled: sudo systemctl status sshd
RUN systemctl enable sshd
RUN systemctl start sshd

# Check if opening the firewall is needed with: sudo systemctl status firewalld
RUN firewall-cmd --permanent --add-service=http
RUN firewall-cmd --permanent --add-service=https
RUN systemctl reload firewalld


# RUN dnf -y module install python39 && \
# 	dnf clean all
RUN dnf clean all
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash

RUN sudo EXTERNAL_URL="https://gitlab.valleybee.com" yum install -y gitlab-ce

# RUN yum -y install python39-pip && \
# 	dnf clean all 


#RUN pip3 install ansible --user
COPY . /app
WORKDIR /app

# RUN pip3.9 install -r req.txt