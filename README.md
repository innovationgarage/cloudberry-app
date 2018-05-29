# Cloudberry Server

This repository contains a docker compose file for running

* Cloudberry Djangoproject
* [radius](README-radius.md)
* [elasticsearch](README-ELK.md)
* logstash
* postgres

## Running

    docker-compose up

## Stopping, removing everything

    docker-compose stop
    docker-compose rm -f
    docker volume rm cloudberryapp_database
    docker volume rm cloudberryapp_radiuslogs

    docker rmi -f $(docker images | grep "^cloudberryapp" | sed -e "s+  .*++g")
