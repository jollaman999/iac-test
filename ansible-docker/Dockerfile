FROM ubuntu:focal

RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list

RUN apt update

RUN apt install -y iproute2
RUN apt install -y net-tools
RUN apt install -y iputils-ping

RUN apt install -y ansible

RUN apt install -y bash-completion
RUN apt install -y python3-argcomplete
RUN mkdir -p /etc/bash_completion.d
RUN activate-global-python-argcomplete3

RUN apt install -y ansible-lint

RUN /usr/bin/ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
RUN apt install -y sshpass
