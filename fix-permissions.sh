#!/bin/bash

# Diretórios a serem modificados
DIRS="wp-core plugins themes"

# Detectar a distribuição e definir o usuário apropriado
if grep -q "Ubuntu" /etc/os-release; then
    WEB_USER="www-data"
elif grep -q "Manjaro" /etc/os-release; then
    WEB_USER="http"
else
    echo "Distribuição não suportada!"
    exit 1
fi

# Alterar o proprietário para USER:WEB_USER
sudo chown -R $USER:$WEB_USER $DIRS

# Alterar permissões para 775
sudo chmod -R 775 $DIRS

echo "Permissões e proprietário alterados para os diretórios: $DIRS com o usuário da web: $WEB_USER"
