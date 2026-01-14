

##
## ## Base
##

From ubuntu:25.10 as ubuntu-iso-factory-25.10




##
## ## Source
##

COPY src /opt/src




##
## ## Repo / Update / Info
##

Run apt-get update




##
## ## Package / Install / Locale
##

Run DEBIAN_FRONTEND=noninteractive apt-get install locales tzdata -y




##
## ## Locale / Init
##

Run echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen

Run locale-gen

Run echo 'en_US.UTF-8' > /etc/default/locale

Run ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime




##
## ## Package / Install / Requirement
##

Run DEBIAN_FRONTEND=noninteractive apt-get install systemctl sudo debootstrap -y




##
## ## Package / Install / Extra
##

Run DEBIAN_FRONTEND=noninteractive apt-get install bash-completion vim -y
