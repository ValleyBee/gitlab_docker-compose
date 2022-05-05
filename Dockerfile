FROM centos:stream8
LABEL MAINTAINER Valentyn 'valley@mail.ru'
RUN yum update -y

RUN dnf -y module install python39 && \
	dnf clean all

RUN yum -y install python39-pip && \
	dnf clean all 


#RUN pip3 install ansible --user
COPY . /app
WORKDIR /app

RUN pip3.9 install -r req.txt