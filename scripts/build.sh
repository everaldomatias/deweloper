#!/bin/bash
COMPOSE_PROJECT_NAME=${PWD##*/} docker-compose up --build
