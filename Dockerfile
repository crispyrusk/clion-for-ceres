FROM kurron/docker-jetbrains-base:latest

RUN apt-get update && \
	apt-get install -y \
		gcc cmake \
		autoconf automake \
		libgoogle-glog-dev \
		libatlas-base-dev \
		libeigen3-dev \
		libsuitesparse-dev \
		git wget \
		openssh-server \
		gdb gdbserver g++ gcc \
		build-essential


ADD https://download.jetbrains.com/cpp/CLion-2017.1.3.tar.gz /tmp/ide.tar.gz

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

ENV CL_JDK=/usr/lib/jvm/oracle-jdk-8 

ENTRYPOINT ["/bin/bash"]

