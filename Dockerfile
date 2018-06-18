FROM openjdk:8-jre
MAINTAINER Martin Lu <luxi78@gmail.com>

RUN apt-get update && \                                                                                                │    container_name: phpldapadmin
    apt-get upgrade -y && \                                                                                            │    environment:
    apt-get install -y apt-utils && \                                                                                  │      PHPLDAPADMIN_LDAP_HOSTS: "openldap"
    apt-get install -y git openssh-server supervisor tmux net-tools vim && \                                           │      PHPLDAPADMIN_HTTPS: "false"
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*                       

RUN echo "Create user/group gerrit2" &&  \
    groupadd -g 1000 -r gerrit2 && \
    useradd -u 1000 --create-home -r -g gerrit2 gerrit2

WORKDIR /tmp    

VOLUME ["/gerrit_site", "/gerrit_site/git"]

expose 8080
