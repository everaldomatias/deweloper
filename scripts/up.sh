#!/bin/bash
set -e

COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME:-${PWD##*/}} docker compose up