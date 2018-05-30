#! /bin/sh

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

    if [ "${DOCKER_MANAGER_UUID}" != "" ]; then
      cat > examples/docker-manager-device.json <<EOF
[
  {
    "id": "${DOCKER_MANAGER_UUID}",
    "created": "2018-05-30 08:08:13",
    "modified": "2018-05-30 08:08:13",
    "name": "docker-manager",
    "key": "${DOCKER_MANAGER_KEY}",
    "model": "",
    "os": "",
    "system": "",
    "notes": "",
    "mac_address": "",
    "status": "modified",
    "last_ip": "",
    "backend": "/cloudberry/cloudberry_app/schema/backend/cloudberry_netjson.OpenWrt"
  }
]
EOF
      python3 manage.py import_file --resource-class cloudberry_app.importexport.DeviceResource examples/docker-manager-device.json
    fi
)

/etc/init.d/apache2 start

while sleep 1; do
    :
done
