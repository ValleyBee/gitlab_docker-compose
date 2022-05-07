FROM docker.io/library/ubuntu:arm64 

LABEL MAINTAINER Valentyn 'valley@mail.ru'
ENV TZ=Europe/Kiev

RUN apt-get update -yq
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install  -yq openssh-server ca-certificates tzdata perl 
RUN apt-get install -yq curl 
RUN apt-get install -yq gnupg 
# RUN apt-get update -y
RUN apt-get install -yq apt-transport-https
RUN curl -L https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey | apt-key add -
RUN apt install -yq python3
RUN apt install -yq python3-pip
RUN pip install -U pip
RUN apt-get update -yq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends apt-utils
RUN echo  "deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ focal main" > /etc/apt/sources.list.d/gitlab_gitlab-ce.list

# RUN echo -e 'DISTRIB_ID=Ubuntu\nDISTRIB_RELEASE=20.04\nDISTRIB_CODENAME=focal\nDISTRIB_DESCRIPTION="Ubuntu 20.04.4 LTS" ' > /etc/lsb-release 


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
# RUN echo $PWD $HOME
# RUN echo test > $HOME/.test.sh
# RUN ls -la /root
RUN curl -sS  https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh > $HOME/.script.sh 
RUN chmod a+x $HOME/.script.sh
# RUN  ls -la /root
RUN $HOME/.script.sh
# RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh 
# | sudo bash

# RUN EXTERNAL_URL="https://gitlab.valleybee.home" apt-get install -yq gitlab-ce=14.9.4-ce.0


# RUN yum -y install python39-pip && \
# 	dnf clean all 


#RUN pip3 install ansible --user
COPY . /app

WORKDIR /app

# RUN pip3.9 install -r req.txt