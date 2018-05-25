FROM innovationgarage/openwrt:snapshot-2018-05-24

ADD customfeeds.conf /etc/opkg/customfeeds.conf

RUN opkg update
RUN opkg install pgsql-server pgsql-cli
RUN opkg install freeradius2-mod-always freeradius2-mod-attr-filter freeradius2-mod-attr-rewrite freeradius2-mod-chap freeradius2-mod-detail freeradius2-mod-eap freeradius2-mod-eap-gtc freeradius2-mod-eap-md5 freeradius2-mod-eap-mschapv2 freeradius2-mod-eap-peap freeradius2-mod-eap-tls freeradius2-mod-eap-ttls freeradius2-mod-exec freeradius2-mod-expiration freeradius2-mod-expr freeradius2-mod-files freeradius2-mod-ldap freeradius2-mod-logintime freeradius2-mod-mschap freeradius2-mod-pap freeradius2-mod-passwd freeradius2-mod-preprocess freeradius2-mod-radutmp freeradius2-mod-realm freeradius2-mod-sql freeradius2-mod-sql-mysql freeradius2-mod-sql-pgsql freeradius2-mod-sql-sqlite freeradius2-mod-sqlcounter freeradius2-mod-sqllog freeradius2-utils
RUN opkg install shadow-useradd
RUN opkg install shadow-su

RUN opkg install git-http ca-bundle
RUN opkg install python3-pip python3-cffi python3-cryptography

RUN pip3 install --upgrade pip
RUN pip install --upgrade setuptools
RUN cd /usr/bin; ln -s python3 python

RUN pip install gunicorn

RUN opkg install nginx

RUN git clone https://github.com/innovationgarage/cloudberry-djangoproject.git
RUN cd cloudberry-djangoproject; pip3 install -r requirements.txt 
RUN cd cloudberry-djangoproject; python manage.py migrate
RUN cd cloudberry-djangoproject; python manage.py createsuperuser --noinput --username admin --email a@a.com
RUN cd cloudberry-djangoproject; python manage.py shell -c "import django.contrib.auth.models; u=django.contrib.auth.models.User.objects.get(username='admin'); u.set_password('password'); u.save()"

ADD freeradius2 /etc/freeradius2
ADD db /root/db
ADD cloudberry-djangoproject.service /etc/init.d/cloudberry-djangoproject
RUN cd /etc/rc.d; ln -s ../init.d/cloudberry-djangoproject S99cloudberry-djangoproject

RUN sed -i -e "s+/var/postgresql+/home/postgresql+g" /etc/config/postgresql
RUN mkdir -p /home/postgresql; chown postgres:postgres /home/postgresql
RUN /root/db/init.sh

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 1812/udp
EXPOSE 1813/udp
