FROM ubuntu:precise

RUN echo > /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse > /etc/apt/sources.list.d/precise.list
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse >> /etc/apt/sources.list.d/precise.list
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse >> /etc/apt/sources.list.d/precise.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -fy openjdk-7-jdk openjdk-6-jdk
RUN apt-get update && apt-get install -fy linux-libc-dev:amd64 linux-libc-dev:i386
RUN apt-get update && apt-get install -fy git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 wget curl gcc g++ cpp cpp-4.6
RUN apt-get update && apt-get install -y ccache dnsutils file bsdmainutils vim-nox advancecomp

# ENV EXPERIMENTAL_USE_JAVA7=1
ENV USE_CCACHE 1
ENV CCACHE_DIR /srv/ccache
ENV ANDROID_JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

RUN wget 'http://commondatastorage.googleapis.com/git-repo-downloads/repo' -O /usr/local/bin/repo
RUN chmod +x /usr/local/bin/repo
RUN [ -d "/srv/ccache" ] || mkdir /srv/ccache
RUN [ -f "/srv/ccache/CACHEDIR.TAG" ] || ccache -M 50G

ADD env-android.sh /etc/profile.d/env-android.sh
