#DOCKER-VERSION 0.9.1
#
#VERSION 0.1
#
# A standard Ubuntu 14.04 image including a version of Mono that is required for running ASP.NET vNext projects

FROM    ubuntu:14.04
MAINTAINER Alexander Köplinger

RUN     sudo apt-get -y install curl unzip git-core build-essential autoconf libtool gettext libgdiplus libgtk2.0-0 xsltproc
WORKDIR /tmp
RUN     git clone https://github.com/mono/mono
WORKDIR /tmp/mono
RUN     git checkout d8eaf05
RUN     ./autogen.sh --prefix=/usr --with-mcs-docs=no
RUN     make get-monolite-latest
RUN     make -j4
RUN     sudo make install
WORKDIR /
RUN     sudo rm -r /tmp/mono

RUN     mozroots --import --sync
RUN     curl https://raw.githubusercontent.com/graemechristie/Home/KvmShellImplementation/kvmsetup.sh | sh

# Use this to download K runtime in a bash shell:
# source ~/.kre/kvm/kvm.sh && kvm upgrade
