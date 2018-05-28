#! /bin/sh

(
    cd cloudberry-djangoproject

    while ! echo "select 1;" | PGPASSWORD=example psql -h db -U postgres postgres > /dev/null 2>&1 ; do
        echo "Wiating for db"
        sleep 2
    done

    make migrate
    make createsuperuser-silent-if-needed
)

/etc/init.d/apache2 start

while sleep 1; do
    :
done
