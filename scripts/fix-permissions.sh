#!/bin/bash

# Diretórios a serem modificados
DIRS="plugins themes"

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

# Alterar permissões para diretórios
sudo find $DIRS -type d -exec chmod 755 {} \;

# Alterar permissões para arquivos
sudo find $DIRS -type f -exec chmod 644 {} \;

echo "Permissões e proprietário alterados para os diretórios: $DIRS com o usuário da web: $WEB_USER"
