# Trabajo final

Para ejecutar la aplicacion, es necesario tener instalado Elasticsearch en su maquina.
Abrir una consola y pararse en el directorio donde se clono el repositorio. Luego, los pasos para ejecutar la aplicacion son:
- `service elasticsearch start` para levantar elastic
- `bundle install` para instalar las dependencias del Gemfile
- `rails db:migrate` para crear la base de datos
- `bundle exec figaro install` para crear el archivo de configuracion de variables de ambiente
- Se debe importar los modelos a Elasticsearch, para eso abrir la consola de rails (`rails c`) y correr los siguientes comandos:
	- `MusicCategory.import(force: true)`
	- `Song.import(force: true)`
	- `MusicDisc.import(force: true)`
	- `MovieCategory.import(force: true)`
	- `Movie.import(force: true)`
	- `BookCategory.import(force: true)`
	- `Book.import(force: true)`
	- `Catalog.import(force: true)`
	- `User.import(force: true)`
- `rails s` para levantar el server

Login con Facebook o Twitter
