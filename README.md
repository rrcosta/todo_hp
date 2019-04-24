[![Codeship Status for rrcosta/todo_hp](https://app.codeship.com/projects/ed26f4d0-3f58-0137-f0bc-3e2a7bf6ae2d/status?branch=master)](https://app.codeship.com/projects/335600)

# Todo - Hug Pay

## Descrição do Projeto
Desenvolver uma aplicação de lista de itens a fazer (to-do list)

Características necessárias:
* O usuário deverá se registrar para criar a sua lista
* O sistema deve permitir vários usuários
* O usuário só poderá ver a sua lista de itens a fazer se estiver logado
* Outro usuário não pode ver a sua lista
* Os itens podem ser marcados com concluídos ou desmarcados
* Itens a concluir e itens concluídos devem ser exibidos em páginas diferentes


## Ambiente de desenvolvimento

### Pre Requirements
* Linux / Mac OSX
* [Git](https://git-scm.com)
* [Ruby 2.6.1](https://www.ruby-lang.org)
* [Rails 5.2.3](https://www.ruby-lang.org)
* [Bundler gem](https://github.com/bundler/bundler)

### Instalações dos pré-requisitos

* Git

O primeiro passo que deverá efetuar será instalar o Git (https://git-scm.com), caso ainda não o tenha.
Vide estes tutoriais para instalação:

  https://git-scm.com/book/pt-br/v1/Primeiros-passos-Instalando-Git
  https://www.liquidweb.com/kb/install-git-ubuntu-16-04-lts/


Após a instalação do git, deverá configura-lo (https://git-scm.com/book/pt-br/v2/Começando-Configuração-Inicial-do-Git) e dar clonar (https://git-scm.com/book/pt-br/v2/Git-Basics-Getting-a-Git-Repository) o seguinte repositório: (git@github.com:rrcosta/api-intelipost.git), após clona-lo deverá seguinte os passos abaixo

* Ruby

Para obter a versão 2.6.1 do Ruby, basta abrir um terminal em seu sistema e digitar um dos seguintes comandos:

Para: Mac

Para maiores detalhes vide: http://railsapps.github.io/installrubyonrails-mac.html

```
 brew install ruby
```

Para: Debian, Ubuntu e derivados

```
sudo apt-get install ruby-full
```

Para: CentOS, Fedora e RHEL

```
sudo yum install ruby
```

Para: Arch Linux, Manjaro, Antergos e derivados

```
sudo pacman -S ruby
```

* Ruby on Rails

Após instalar o ruby (passo acima), deverá instalar o framework Rails, através do comando abaixo

```
gem install rails --version=5.2.3
```

Obs: dependendo das configurações de sua maquina, este processo poderá demorar, mas não se preoucupe esse é o único passo que poderá demorar um pouco ;)

* PostgreSQL

Para instalação do Postgresql, entre neste tutorial e mande brasa na instação de um dos melhores BD gratuidos para se trabalhar!

https://www.edivaldobrito.com.br/como-instalar-o-postgresql-9-4-no-ubuntu-e-centos/


### Procedimentos que deverá efetuar para subir o ambiente

### Instalação e execução da aplicação

1. Faça o clone com **git clone git@github.com:rrcosta/todo_hp.git**

2. Vá ao diretório do projeto e execute

        $ bundle install

3. Copie o conteúdo do arquivo .env.example para o arquivo .env e altere com as credenciais de seu ambiente local

        $ cp .env.example .env

4. Abra o arquivo .env e coloque os seus dados de acesso do seu banco de dados Postgrsql


5. Faça o setup do banco de dados: Criação do Banco de Dados

        $ bin/rails db:create

6. Faça o setup do banco de dados: Criação das tabelas Banco de Dados

        $ bin/rails db:migrate

7. Inicie a aplicação usando o servidor local (Irá iniciar na porta padrão que é a 3000)

        $ rails s

8. Ao subir, efetue o cadastro de um usuário, através do botão SignUp

9. Após cadastrar o usuário, logue-se na aplicação e cria as tarefas desejadas

10. Visualize o Dasboard com o gráfico de pizza e os totais de tarefas realizadas e pendentes.


