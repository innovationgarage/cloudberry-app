cat <<EOF
[
  {
    "refers_devices": [
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
        "backend": "/cloudberry_app/schema/backend/cloudberry_netjson.OpenWrt"
      }
    ],
    "id": "1ce45828-9f93-442b-b3db-f3a099a8e8b6",
    "created": "2018-05-30 20:19:33",
    "modified": "2018-05-30 20:19:33",
    "name": "docker-manager",
    "config": {
      "device": "fk://cloudberry_app.Device/${DOCKER_MANAGER_UUID}"
    },
    "refers_configs": [],
    "backend": "/cloudberry_app/schema/dynamic/30e867c0-2c74-41ca-afc8-2e9fdd93460e"
  }
]
EOF
