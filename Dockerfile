FROM openjdk:8-jre
MAINTAINER SCM-DEPT <scm@letv.cn>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get install -y git openssh-server supervisor tmux net-tools vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "Create user/group gerrit2" &&  \
    groupadd -g 1000 -r gerrit2 && \
    useradd -u 1000 --create-home -r -g gerrit2 gerrit2
    printf "ServerAliveCountMax 1\nServerAliveInterval 30\nExitOnForwardFailure yes\n" >> /etc/ssh/ssh_config && \
    printf "GatewayPorts yes\nClientAliveInterval 30\nClientAliveCountMax 1\nPort 80\n" >> /etc/ssh/sshd_config


WORKDIR /tmp    

VOLUME ["/gerrit_site/git", "/gerrit_site/cache", "/gerrit_site/index", "/gerrit_site/logs", "/gerrit_site/tmp"]

expose 8080 29418
