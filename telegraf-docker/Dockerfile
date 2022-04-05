FROM ubuntu:focal

RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list

RUN apt update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
RUN apt install -y tzdata

RUN apt install -y iproute2
RUN apt install -y net-tools
RUN apt install -y iputils-ping

RUN apt install -y wget
RUN apt install -y vim

RUN apt install -y ssh
RUN apt install -y sudo
RUN useradd -s /bin/bash -G sudo -m docker
# Change Password : echo "User:Password" | chpasswd
RUN echo "docker:docker" | chpasswd
RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN service ssh stop 

RUN wget -c https://dl.influxdata.com/telegraf/releases/telegraf_1.22.0-1_amd64.deb -O telegraf_1.22.0-1_amd64.deb
RUN dpkg -i telegraf_1.22.0-1_amd64.deb
RUN rm telegraf_1.22.0-1_amd64.deb

COPY telegraf.conf /etc/telegraf/telegraf.conf.base

RUN service telegraf stop

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
