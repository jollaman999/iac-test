FROM ubuntu:focal

RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list

RUN apt update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
RUN apt install -y tzdata

RUN apt install -y wget unzip

RUN apt install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt update && apt install -y terraform

RUN curl -s https://api.github.com/repos/dmacvicar/terraform-provider-libvirt/releases/latest \
  | grep browser_download_url \
  | grep linux_amd64.zip \
  | cut -d '"' -f 4 \
  | wget -i -

RUN unzip terraform-provider-libvirt_*_linux_amd64.zip
RUN rm -f terraform-provider-libvirt_*_linux_amd64.zip

RUN mkdir -p ~/.terraform.d/plugins/
RUN mv terraform-provider-libvirt_* ~/.terraform.d/plugins/terraform-provider-libvirt

# Needed for cloud-init
RUN apt install -y genisoimage
