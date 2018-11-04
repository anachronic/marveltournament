# Notas de desarrollo

## Peleas

Crearemos un servicio de Rails que genere peleas para mantener la lógica de
controllers (que generarán una pelea cuando el usuario lo pide) y los jobs (que
generarán peleas cada 10 mins y resetearán el ranking) lo más legible que se
pueda.

## API de Marvel

La API de marvel nos entrega info por límites, lo que puede parecer horrible al
principio, pero luego de fijarnos bien, podemos tomar esto como ventaja y
paginar nuestros resultados.

## Fuentes de datos

El proyecto partirá con *todo* hecho en backend, al ser Rails el objetivo
primario de este proyecto. Si logramos hacerlo rápido, podría migrarse el fetch
de datos a back-end, pero lo dejaremos como baja prioridad.

## Diseño de la db

Nuestros recursos propios (ie: no vienen de afuera) son las peleas y las
personas. Las personas son un clásico scaffold de rails, así que ahí no hay
problema. Necesitaremos un campo boolean para saber si la persona está muerta o
no. Un trabajo en el fondo (background) será encargado de resetear este valor.

Luego tendëíamos peleas, que deben almacenar un timestamp (momento en que
ocurrieron), el id de la persona que peleó y el id del héroe que peleó. El id
del héroe hará matching con la API de Marvel.

## El index

El index podríamos hacer lo sgte:

  - Mostrar el tiempo para la próxima batalla
  - Mostrar las últimas 5 peleas y entre quienes fue (a la derecha, p. ej.)
  - Botones para nueva persona y forzar una pelea right now.
  - Mostrar el ranking de personas (a la izquierda)

## Jobs en el background

Necesitamos jobs en background para esto (uf!).

  1. Cada 10 minutos una pelea sí o sí
  2. Todos los días a las 0:00 resetear el ranking y estatus de los jugadores

## Gemas relevantes

El proyecto utiliza algunas gemas que pueden necesitar que se lea su
documentación

1. `faraday` para requests a Marvel
2. `bootstrap_form` para el rendering de forms y modelos
3. `pry-rails` para usar `pry` en vez de `irb` en `rails console`
4. `byebug` para debugging
5. `dotenv-rails` para no revelar claves públicas y privadas
