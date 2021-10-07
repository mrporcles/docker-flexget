FROM python:3.9-alpine
LABEL maintainer mrporcles@gmail.com
RUN apk update && apk upgrade && apk add g++ bash shadow linux-headers && pip3 install flexget supervisor

ADD setup/*.conf /etc/supervisor.conf
ADD setup/root/*.sh /root/
ADD setup/root/*.yml /root/
ADD apps/nobody/*.sh /home/nobody/
ADD apps/nobody/*.conf /etc/supervisor/conf.d/

RUN chmod +x /root/*.sh /home/nobody/*.sh

VOLUME ["/config"]
VOLUME ["/mnt"]

EXPOSE 3539/tcp
CMD ["/bin/bash", "/root/init.sh"]
