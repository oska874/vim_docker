FROM ubuntu:18.04

MAINTAINER ezio <ezio_zhang@outlook.com>

# build with docker build --build-arg PETA_VERSION=2018.1 --build-arg PETA_RUN_FILE=petalinux-v2018.1-final-installer.run -t petalinux:2018.1 .



ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" >> /etc/timezone
#install dependences:
RUN sed -i.bak s/archive.ubuntu.com/mirror.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && \
  dpkg --add-architecture i386 && apt-get update && apt-get install -y \
  build-essential \
  sudo \
  tofrodos \
  iproute2 \
  global \
  ctags \
  gawk \
  net-tools \
  expect \
  libncurses5-dev \
  tftpd \
  libssl-dev \
  flex \
  bison \
  libselinux1 \
  gnupg \
  wget \
  socat \
  gcc-multilib \
  libsdl1.2-dev \
  libglib2.0-dev \
  lib32z1-dev \
  zlib1g:i386 \
  libgtk2.0-0 \
  screen \
  tmux \
  pax \
  diffstat \
  xvfb \
  xterm \
  texinfo \
  gzip \
  p7zip \
  unzip \
  cpio \
  chrpath \
  autoconf \
  lsb-release \
  libtool \
  libtool-bin \
  locales \
  cmake \
  pathogen \
  vim \ 
  zsh \
  git



RUN locale-gen en_US.UTF-8 && update-locale

#make a Vivado user
RUN adduser --disabled-password --gecos '' vimer&& \
  usermod -aG sudo vimer && \
  echo "vimer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER vimer 
ENV HOME /home/vimer
ENV LANG en_US.UTF-8
RUN mkdir /home/vimer/project
WORKDIR /home/vimer/project

COPY vim/ /home/vimer/
RUN cd /home/vimer/vim-plugins/ && \
    sudo cp -r vim74/* /usr/share/vim/vim80/ && \
    cp -r .vim /home/vimer/ && \
    cp .vimrc /home/vimer/
RUN ls -la /home/vimer/
#RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc 
   #chsh -s /bin/zsh

