#!/usr/bin/env bash


docker exec -it mariadb mariadb-dump -u root -p compact > $1
