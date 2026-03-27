# deWeloPer

## Ambiente local de desenvolvimento WordPress com Docker.

Este repositório fornece uma stack pronta para desenvolvimento local com:

- WordPress
- MariaDB
- phpMyAdmin
- MailHog
- WP-CLI

## Stack atual

O ambiente publicado atualmente utiliza:

- WordPress `6.5.4` com PHP `8.1` e Apache
- MariaDB
- phpMyAdmin
- MailHog
- WP-CLI instalado no container do WordPress

## Estrutura principal

```text
.
├── Dockerfile
├── docker-compose.yml
├── entrypoint.sh
├── .env.example
├── .htaccess
├── db_data/
├── themes/
└── scripts/
    ├── build.sh
    ├── up.sh
    ├── down.sh
    ├── stop.sh
    └── fix-permissions.sh
```

## Pré-requisitos

Antes de começar, você precisa ter instalado:

- Docker
- Docker Compose
- Git

## Clonando o projeto

`git clone git@github.com:everaldomatias/deweloper.git`
`cd deweloper`

## Arquivo .env

Existe um arquivo .env.example na raiz do projeto. Crie seu .env a partir dele:

`cp .env.example .env`

## Subindo o ambiente

Na primeira execução:

`./scripts/build.sh`

Após a primeira construção, para subir novamente:

`./scripts/up.sh`

## Serviços disponíveis

Depois que o ambiente estiver no ar, os acessos padrão são:

### WordPress

- URL: http://localhost
- Admin: http://localhost/wp-admin

### Credenciais padrão:

- usuário: admin
- senha: admin

### phpMyAdmin

- URL: http://localhost:8080
- servidor: db
- usuário: root
- senha: pass

### MailHog

- SMTP: localhost:1025
- interface web: http://localhost:8025

O MailHog é útil para capturar e-mails disparados pelo WordPress durante o desenvolvimento.

## Contribuindo

Se você encontrar problemas ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma [issue](https://github.com/everaldomatias/deweloper/issues) ou enviar um pull [request](https://github.com/everaldomatias/deweloper/pulls).
## Licença

Este projeto está licenciado sob a licença MIT.
