FROM ubuntu:latest

RUN echo version 2 cache punch

RUN apt update

RUN apt install -y git python3 python3-pip apache2 libapache2-mod-wsgi-py3 python3-psycopg2 postgresql-client virtualenv

RUN git clone https://github.com/innovationgarage/cloudberry-djangoproject.git
RUN virtualenv --system-site-packages --python=python3 cloudberry-djangoproject/env

RUN cd cloudberry-djangoproject; make install-depends

RUN echo version 5 cache punch

RUN cd cloudberry-djangoproject; git pull; make install-depends

ADD local_settings.py /cloudberry-djangoproject/local_settings.py
ADD docker-manager-config.json.sh /cloudberry-djangoproject/docker-manager-config.json.sh
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD server.sh /server.sh

CMD /server.sh

EXPOSE 80
