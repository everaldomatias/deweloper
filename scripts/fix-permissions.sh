#!/bin/bash
set -e

DIRS="plugins themes"

mkdir -p plugins themes

echo "Ajustando permissões básicas dos diretórios locais..."
find $DIRS -type d -exec chmod 775 {} \;
find $DIRS -type f -exec chmod 664 {} \;

echo "Permissões ajustadas."
echo "Ownership não será alterado por este script."
echo "Se ainda houver conflito, confira HOST_UID e HOST_GID no .env e refaça o build."