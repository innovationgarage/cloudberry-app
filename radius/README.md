# Build image and start container

    docker build --tag cloudberry-radiusdocker .
    CONTAINER=$(docker run -d cloudberry-radiusdocker /sbin/init)
    docker exec -it $CONTAINER /bin/sh

# Test radius

You fist must populate the database with some dummy data:

    PGPASSWORD=example psql -h db -U postgres postgres < /root/db/content.sql

After this you can do a test authentication against radius with

    root@LEDE:/# echo "User-Name=fredf,User-Password=wilma" | radclient localhost:1812 auth testing123
    Received response ID 161, code 2, length = 20
    root@LEDE:/# echo "User-Name=fredf,User-Password=badpass" | radclient localhost:1812 auth testing123
    Received response ID 84, code 3, length = 20
    root@LEDE:/# 

# Developing radius config

Inside the container freeradius config is in `/etc/freeradius2`

You can check the syntax of the freeradius config by running `radiusd -X`. Once it does not complain about syntax/semantics
errors, you can restart radius with `/etc/init.d/radiusd restart`


