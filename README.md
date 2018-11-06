# README

Este README contiene instrucciones para correr esta aplicación sobre
un sistema UNIX. Lo testearemos con Arch Linux y Ubuntu.

## Prerequisitos

Instale Ruby, Rubygems, y PostgreSQL desde su distribución. Usaremos
PostgreSQL para desarrollo en vez de SQLite para evitarnos dolores de
cabeza de configuración desde el principio

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

## Migre la base de datos

``` bash
$ rails db:migrate
```

## Instalar Redis

Este proyecto ocupa Redis. Para instalarlo:

### Arch Linux

``` bash
# pacman -S redis
```

Arch Linux no inicia el servicio de redis automáticamente, así que
mándele señal de start con

``` bash
# systemctl start redis.service
```

Si evitar el tedio de tener que correr esto cada vez que reinicia su
máquina, habilite el servicio perpetuamente

``` bash
# systemctl enable redis.service
```

### Ubuntu

``` bash
# apt install redis
```

Ubuntu parte el servicio y lo habilita automáticamente, nada más que
hacer ahí


### Otras distros

Visite [Redis](https://redis.io/download) y siga sus
instrucciones. Probablemente en MacOS esté disponible vía
[brew](https://brew.sh/) y en Fedora via `dnf`.


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
