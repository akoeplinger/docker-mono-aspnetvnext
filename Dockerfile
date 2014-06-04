#DOCKER-VERSION 0.9.1
#
#VERSION 0.1.0
#
# A standard Ubuntu 14.04 image including a version of Mono that is required for running ASP.NET vNext projects

FROM    ubuntu:14.04
MAINTAINER Alexander Köplinger

RUN \
    sudo apt-get -y install curl unzip git-core build-essential autoconf libtool gettext libgdiplus libgtk2.0-0 xsltproc && \
	cd /tmp && git clone https://github.com/mono/mono && \
    cd /tmp/mono && git checkout d8eaf05 && \
	./autogen.sh --prefix=/usr --with-mcs-docs=no && \
	make get-monolite-latest && \
	make -j4 && \
	sudo make install && \
	cd / && sudo rm -r /tmp/mono

RUN   mozroots --import --sync
RUN   curl https://raw.githubusercontent.com/graemechristie/Home/KvmShellImplementation/kvmsetup.sh | sh
RUN   git clone https://github.com/davidfowl/HelloWorldVNext /tmp/helloworld

# Use this to download K runtime in a Bash shell:
# source ~/.kre/kvm/kvm.sh && kvm upgrade
