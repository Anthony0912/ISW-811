## Crear app en heroku

1. Creamos un proyecto nuevo de laravel

```Bash
composer create-project --prefer-dist laravel/laravel heroku.isw811
```

2. Si estamos en windows instalamos el archivo .exe de la siguiente pagina de [heroku](https://devcenter.heroku.com/articles/heroku-cli)

3. Luego hacemos login en heroku

```Bash
heroku login
```

4. Despues en la consola nos aparecera que deberemos precionar cualquier tecla para continuar. Le damos login en la pagina de heroku.

5. Creamos el siguiente archivo de configuracion para heroku

```Bash
echo "web: vendor/bin/heroku-php-apache2 public/" > Procfile
```

6. Cremos el contenedor de heroku para nuestro sitio web

```Bash
heroku create
```

7. Creamos un commit y push para subir los nuevos cambios hacia nuestro nuevo contenedor de heroku

```Bash

```
