FROM          ubuntu:latest
MAINTAINER    Khris Richardson <khris.richardson@gmail.com>

ENV           tree_ish develop

ADD         ./bootstrap.sh /
RUN         ./bootstrap.sh git ${tree_ish}

ONBUILD ADD ./etc/salt/grains                                                  \
             /etc/salt/

ONBUILD RUN ./bootstrap.sh git ${tree_ish}

CMD        ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]

EXPOSE        22
