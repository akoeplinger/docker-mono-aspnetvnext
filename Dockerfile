FROM    ubuntu:latest
MAINTAINER      Zachary Jones <prozachj@gmail.com>

RUN     apt-get -qq update

RUN     apt-get -qqy install libtool autoconf g++ gettext make git unzip && \
        git clone -b mono-3.6.0-branch https://github.com/mono/mono /tmp/mono && \
        cd /tmp/mono && \
        ./autogen.sh --prefix=/usr && \
        make get-monolite-latest && \
        make && \
        make install && \
        cd / && \
        rm -rf /tmp/mono
RUN     mono --version

ENV     HOME  /root
RUN     mozroots --import --sync
RUN     curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh > /root/kvminstall.sh && \
        sh /root/kvminstall.sh && \
        /bin/bash -c "source ~/.kre/kvm/kvm.sh && kvm upgrade; echo ExitCode=$?"

RUN     git clone https://github.com/davidfowl/HelloWorldVNext.git ~/HelloWorldVNext
RUN     /bin/bash -c "cd ~/HelloWorldVNext && source ~/.kre/kvm/kvm.sh && kpm restore"



