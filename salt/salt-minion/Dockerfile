FROM          ubuntu:latest
MAINTAINER    Khris Richardson <khris.richardson@gmail.com>

ADD         ./bootstrap.sh /
RUN         ./bootstrap.sh git develop

ONBUILD ADD ./etc/salt/grains                                                  \
             /etc/salt/

ONBUILD RUN ./bootstrap.sh git develop

CMD        ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
