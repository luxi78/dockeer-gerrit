FROM openjdk:8-jre
MAINTAINER Martin Lu <luxi78@gmail.com>

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "Create user/group gerrit2" &&  \
    groupadd -g 1000 -r gerrit2 && \
    useradd -u 1000 --create-home -r -g gerrit2 gerrit2

WORKDIR /tmp    

VOLUME ["/gerrit_site", "/gerrit_site/git"]

expose 8080
