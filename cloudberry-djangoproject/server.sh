#! /bin/bash

(
    cd cloudberry-djangoproject

    while ! echo "select 1;" | PGPASSWORD=example psql -h db -U postgres postgres > /dev/null 2>&1 ; do
        echo "Waiting for db"
        sleep 2
    done

    make migrate
    make createsuperuser-silent-if-needed
    make defaultdata

    source env/bin/activate

    python manage.py collectstatic --noinput
    
    if [ "${DOCKER_MANAGER_UUID}" != "" ]; then

      ./docker-manager-config.json.sh > examples/docker-manager-config.json
      python3 manage.py import_file --resource-class cloudberry_app.importexport.ConfigResource examples/docker-manager-config.json
    fi
)

/etc/init.d/apache2 start

while sleep 1; do
    :
done
