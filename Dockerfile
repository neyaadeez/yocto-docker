FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc build-essential \
    chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev pylint xterm curl locales sudo \
    && apt-get clean

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN useradd -ms /bin/bash yocto && echo "yocto ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER yocto
WORKDIR /home/yocto

# Optional: Set timezone (to avoid tzdata prompt)
ENV TZ=Etc/UTC
