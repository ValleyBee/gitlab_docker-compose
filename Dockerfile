FROM docker.io/library/ubuntu:arm64 

LABEL MAINTAINER Valentyn 'valley@mail.ru'
ENV TZ=Europe/Kiev

RUN apt-get update -y
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y openssh-server ca-certificates tzdata perl 
RUN apt-get install -q -y curl 
RUN apt-get install -y gnupg 
RUN apt-get update -y
RUN apt-get install -y apt-transport-https
RUN curl -L https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey | apt-key add -
RUN apt-get update -y
RUN echo  "deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ focal main" > /etc/apt/sources.list.d/gitlab_gitlab-ce.list



# Enable OpenSSH server daemon if not enabled: sudo systemctl status sshd
# RUN systemctl enable sshd
# RUN systemctl start sshd

# Check if opening the firewall is needed with: sudo systemctl status firewalld
#RUN firewall-cmd --permanent --add-service=http
#RUN firewall-cmd --permanent --add-service=https
#RUN systemctl reload firewalld


# RUN dnf -y module install python39 && \
# 	dnf clean all
#RUN dnf clean all
# ENV dist=focal
# ENV os=ubuntu
RUN dist="focal" ; os="ubuntu" ; curl -sS  https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

# RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh 
# | sudo bash

RUN EXTERNAL_URL="https://gitlab.valleybee.home" apt-get install -y gitlab-ce


# RUN yum -y install python39-pip && \
# 	dnf clean all 


#RUN pip3 install ansible --user
COPY . /app

WORKDIR /app

# RUN pip3.9 install -r req.txt