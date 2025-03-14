#!/bin/bash

# Verifica se há contêineres em execução
if [ "$(docker ps -q)" ]; then
  echo "Parando todos os contêineres..."
  docker stop $(docker ps -q)
  echo "Todos os contêineres foram parados."
else
  echo "Nenhum contêiner está em execução."
fi
