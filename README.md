# deWeloPer

## Ambiente de desenvolvimento WordPress com Docker

Este repositório contém a configuração necessária para criar um ambiente de desenvolvimento WordPress utilizando Docker. Inclui um container para o WordPress, um para o banco de dados MariaDB e um para o phpMyAdmin.

## Pré-requisitos

- Docker
- Docker Compose

## Estrutura do projeto

- `wp-core/`: Diretório onde os arquivos principais do WordPress serão armazenados.
- `plugins/`: Diretório para os plugins do WordPress.
- `themes/`: Diretório para os temas do WordPress.
- `db_data/`: Volume para os dados do banco de dados MariaDB.

## Configuração do ambiente

1. Clone o repositório:
    ```sh
    git clone git@github.com:everaldomatias/deweloper.git
    cd deweloper
    ```

## Iniciando o ambiente

Para iniciar o ambiente de desenvolvimento, execute o seguinte comando:
```sh
docker-compose up --build
```

Isso irá construir as imagens Docker conforme definido no `Dockerfile` e iniciar os containers em segundo plano.

### Acessando o WordPress

Após iniciar os containers, você pode acessar o WordPress no seu navegador através do endereço:
[http://localhost](http://localhost)

### Acessando o painel administrativo do WordPress

[http://localhost/wp-admin](http://localhost/wp-admin)

Usuário: admin
Senha: admin

### Acessando o phpMyAdmin

Para acessar o phpMyAdmin e gerenciar o banco de dados MariaDB, utilize o seguinte endereço:
[http://localhost:8080](http://localhost:8080)

- **Usuário**: root
- **Senha**: pass
- **Servidor**: db

## Considerações adicionais

- As alterações feitas nos diretórios `wp-core`, `plugins` e `themes` serão persistidas e refletidas diretamente no ambiente de desenvolvimento.
- O volume `db_data` garante que os dados do banco de dados sejam persistentes entre reinicializações dos containers.
- A estrutura dos links permanentes é configurada automaticamente após a instalação do WordPress através do script `entrypoint.sh`para "postname".

## Problemas comuns

### Pedindo credenciais FTP ao instalar plugins

Se o WordPress pedir credenciais FTP ao tentar instalar plugins, certifique-se de que as permissões dos diretórios `wp-core`, `plugins` e `themes` estão corretas:
```sh
sudo chown -R $USER:$USER wp-core plugins themes
sudo chmod -R 755 wp-core plugins themes
```

### Banco de dados não conectando

Se houver problemas de conexão com o banco de dados, certifique-se de que o container do MariaDB está funcionando corretamente e que as credenciais no `docker-compose.yml` estão corretas.

## Contribuindo

Se você encontrar problemas ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma [issue](https://github.com/everaldomatias/deweloper/issues) ou enviar um pull [request](https://github.com/everaldomatias/deweloper/pulls).

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.
