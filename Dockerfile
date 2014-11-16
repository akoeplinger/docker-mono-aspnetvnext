# DOCKER-VERSION 1.3.0
#
# VERSION 0.3.0
#
# Mono-based image capable of running ASP.NET vNext projects

FROM       microsoft/aspnet:1.0.0-beta1
MAINTAINER Alexander Köplinger

RUN   apt-get -y install git-core

RUN   git clone https://github.com/davidfowl/HelloWorldVNext ~/helloworld
RUN   sed -i s/aspnetvnext/aspnetmaster/g ~/helloworld/NuGet.Config

ONBUILD RUN echo "!! This image is obsolete, Microsoft now provides an official Docker image: https://registry.hub.docker.com/u/microsoft/aspnet/ !!"