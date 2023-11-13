# FROM debian:jessie
FROM ubuntu:22.04

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/barm0leykin/net-utils-container.gitr"

RUN apt-get update \
    && apt-get install -y traceroute iputils-ping iputils-tracepath iputils-arping dnsutils netcat-openbsd nmap \
        net-tools iperf ethtool iproute2 curl wget whois jq vim \
    && rm -rf /var/lib/apt/lists/*

COPY bash.bashrc /etc/bash.bashrc
COPY dns_check.sh /root/dns_check.sh

WORKDIR /root
# bashrc config
RUN echo "source /etc/bash.bashrc" >> /root/.bashrc
