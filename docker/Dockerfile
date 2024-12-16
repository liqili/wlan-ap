FROM ubuntu:focal
LABEL maintainer="Kunkka Li <liqili2005@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV TERM xterm-256color


WORKDIR /build

RUN \
    # Install latest packages
    apt-get -y dist-upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y --no-install-recommends \
      install vim lib32ncurses-dev dos2unix libtool-bin cmake libproxy-dev   \
      uuid-dev liblzo2-dev autoconf automake bash bison bzip2 diffutils  \
      file flex m4 g++ gawk groff-base libncurses5-dev libtool libslang2 \
      make patch perl pkg-config shtool subversion tar texinfo zlib1g    \
      zlib1g-dev git gettext libexpat1-dev libssl-dev cvs gperf unzip    \
      python2 libxml-parser-perl gcc-multilib libxml2-dev g++-multilib   \
      gitk libncurses5 mtd-utils libvorbis-dev xutils-dev autogen sed    \
      build-essential intltool libglib2.0-dev autopoint  autoconf-archive\
      lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools libelf-dev:i386    \
      libelf1:i386 libltdl-dev openssh-server curl nano lzip patchelf    \
      python python3 python3-pip python3-yaml clang\
      automake gosu bc rsync sudo xxd python-is-python2 execstack && \

    # Clean up env
    apt -y autoremove && \
    apt -y autoclean && \
    rm -Rf /var/cache/apt/archives/* && \

    # Set bash as default shell
    ln -s bash /bin/sh.bash && \
    mv /bin/sh.bash /bin/sh && \
    cp /opt/tools/* /usr/bin/ \

    # Set "docker" as root password
    echo "root:docker" | chpasswd && \

    # Adds docker user
    useradd -m docker && \
    echo "docker:docker" | chpasswd && adduser docker sudo && \
    echo "docker ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/docker

RUN pip3 install kconfiglib

# Set docker as default
USER docker:docker
RUN git config --global user.email "liqili2005@gmail.com"
RUN git config --global user.name "Kunkka Li"

CMD ["bash"]

