#!/usr/bin/env bash


mariadb-dump -u root -p compact > $1
