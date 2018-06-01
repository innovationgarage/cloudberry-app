# Cloudberry Server

This repository contains a docker compose file for running

* Cloudberry Djangoproject
* [radius](README-radius.md)
* [elasticsearch](README-ELK.md)
* logstash
* postgres

## Running

    docker-compose up

The configuration UI is available on the host as `http://localhost:8000/cloudberry`, all other protocols (radius, postgres) in their default ports.

Kibana is available at http://localhost:5601. You need to log in with elastic / changeme.

## Stopping, removing everything

    docker-compose stop
    docker-compose rm -f
    docker volume rm cloudberryapp_database
    docker volume rm cloudberryapp_radiuslogs

    docker rmi -f $(docker images | grep "^cloudberryapp" | sed -e "s+  .*++g")

## Deployment

When deploying in production, use the following command line to publish the configuration UI on port 80:

    CLOUDBERRY_PORT_HTTP=80 docker-compose up -d --build
