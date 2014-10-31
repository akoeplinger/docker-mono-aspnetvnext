# DOCKER-VERSION 1.3.0
#
# VERSION 0.2.0
#
# Mono-based image capable of running ASP.NET vNext projects

FROM    mono:3.10
MAINTAINER Alexander Köplinger

RUN   apt-get update && apt-get -y install curl unzip git-core

ENV   HOME  /root
RUN   mozroots --import --sync
RUN   /bin/bash -c "curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh && source ~/.kre/kvm/kvm.sh && kvm upgrade"

RUN   git clone https://github.com/davidfowl/HelloWorldVNext ~/helloworld
RUN   sed -i s/aspnetvnext/aspnetmaster/g ~/helloworld/NuGet.Config
