# README

Este README contiene instrucciones para correr esta aplicación sobre
un sistema UNIX. Lo testearemos con Ubuntu 18.04 LTS. Esta aplicación
utiliza Ruby on Rails 5.2.1 y Ruby 2.5.1, Redis, Sidekiq y PostgreSQL
(incluso en desarrollo).

## Prerequisitos

### Ruby

Una forma decente de instalar Ruby en una máquina es con
[RVM](https://github.com/rvm/ubuntu_rvm). Para ello siga las
instrucciones en dicha página para instalar rvm

Una vez instalado el ppa y rvm, hay que agregarse al grupo `rvm`:

``` bash
rvm group add rvm "$USER"
```

Después de esto salga de su usuario actual (Log Out) y vuelva a
iniciar sesión. Este paso es **muy importante**

### Rails

``` bash
gem install rails
```

### Instalar dependencias en el OS

Necesitaremos PostgreSQL, git, Node.js y Redis

``` bash
sudo apt install postgresql git libpq-dev npm nodejs redis
```

### Configurar Postgres

Primero cambie la contraseña del usuario `postgres`:

``` bash
sudo passwd postgres
```

Luego cree un usuario (en este ejemplo usaremos `rails_dev`):

``` bash
sudo -u postgres createuser --interative
```

Sólo es importante que el usuario creado tenga la posibilidad de crear
nuevas bases de datos

Luego cree la base de datos, ejecute estos comandos en sucesión

``` bash
su - postgres
psql
set role rails_dev;
\password rails_dev;
create database marveltournament_development;
```

El primer comando cambia el usuario a `postgres`, el segundo inicia la
shell de PostgreSQL, el tercero cambia el rol a `rails_dev`, el cuarto
cambia la contraseña (recuérdela!) y finalmente se crea la base de datos

## Clonar este repo

``` bash
git clone https://github.com/anachronic/marveltournament.git
```

## Instalar dependencias

``` bash
$ bundle install
```

## Meter llaves API de Marvel

Para las llaves API de Marvel usamos la gema dotenv de ruby. Ubique sus llaves
pública y privada en el archivo `.env.development.local`. Los nombres de las
variables son

- `MARVEL_PRIVATE_KEY`
- `MARVEL_PUBLIC_KEY`

Por ejemplo, en la raíz del proyecto (`marveltournament`) cree el
archivo `.env.development.local` con el siguiente contenido:

``` bash
MARVEL_PRIVATE_KEY=tullaveprivada
MARVEL_PUBLIC_KEY=tullavepublica
```

Si no tiene sus llaves públicas y privadas, obténgalas en [Marvel
Developer](https://developer.marvel.com/).

## Configure la base de datos

Edite el archivo `config/database.yml` y sobre el bloque `development`
escriba las credenciales.

``` yaml
database: marveltournament_development
username: rails_dev
password: 1234
host: localhost
port: 5432
```

Es importante que `username` y `password` coincidan con las
credenciales del usuario de postgres creado anteriormente

## Migre la base de datos

``` bash
$ rails db:migrate
```

## Correr el server

Este proyecto utiliza [sidekiq](https://sidekiq.org/) y
[sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron) para
ejecutar trabajos periódicos, por lo que correr el servidor involucra
dos pasos

### Server de Rails (puma)

``` bash
$ rails server
```

### Sidekiq

``` bash
$ bundle exec sidekiq
```

Será una terminal por cada instancia

## Producción

Mantenemos una instancia en producción en [heroku](https://www.heroku.com/)

Se puede visitar en [aquí](https://blooming-bayou-77319.herokuapp.com/).
