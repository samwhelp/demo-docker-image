

##
## ## Base
##

FROM debian:13 as debian-iso-factory-13




##
## ## Env
##

ENV DEBIAN_FRONTEND=noninteractive




##
## ## Source
##

COPY src /opt/src




##
## ## Repo / Update / Info
##

RUN apt-get update




##
## ## Package / Install / Locale
##

RUN apt-get install locales tzdata -y




##
## ## Locale / Init
##

RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen

RUN locale-gen

RUN echo 'en_US.UTF-8' > /etc/default/locale

RUN ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime




##
## ## Package / Install / Requirement
##

RUN apt-get install systemctl sudo debootstrap -y




##
## ## Package / Install / Extra
##

RUN apt-get install bash-completion vim -y
