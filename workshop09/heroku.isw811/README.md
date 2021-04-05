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

6. Creamos un nuevo git y un commit para nuestra aplicacion

```Bash
git add .
git commit -m "new commit"

```

7. Cremos el contenedor de heroku para nuestro sitio web y desplegamos nuestra aplicacion haciendo push a heroku

```Bash
heroku create
git push heroku master
```

8. Subimos la variables de entorno necesarias

```Bash
heroku config:set APP_KEY=base64:UD49Z7CzPjCbi6xexO4zGbw7U8QpsSLEQVDlOZTke/M=
heroku config:set DB_CONNECTION=pgsql-hobby-dev
heroku config:set APP_ENV=production
```

9. Instalamos la autenticacion que trae laravel por defecto

```Bash
composer require laravel/ui
php artisan ui bootstrap --auth
npm i && npm run dev
php artisan migrate
```

10. Adquirimos a heroku postgresql como base de datos

```Bash
heroku addons:create heroku-postgresql:hobby-dev
```

11. Configuramos el archivo database.php

```Bash
$url = parse_url(getenv("DATABASE_URL"));
'pgsql-hobby-dev' => [
 'driver' => 'pgsql',
 'url' => env('DATABASE_URL'),
 'host' => env('DB_HOST', $url["host"]),
 'port' => env('DB_PORT', $url["port"]),
 'database' => env('DB_DATABASE', substr($url["path"],1)),
 'username' => env('DB_USERNAME', $url["user"]),
 'password' => env('DB_PASSWORD', $url["pass"]),
 'charset' => 'utf8',
 'prefix' => '',
 'prefix_indexes' => true,
 'schema' => 'public',
 'sslmode' => 'prefer',
 ],
```

12. Corremos la migraciones en heroku

```Bash
heroku run php artisan migrate
```

[Ejemplo en produccion](https://fast-shore-71641.herokuapp.com/)
