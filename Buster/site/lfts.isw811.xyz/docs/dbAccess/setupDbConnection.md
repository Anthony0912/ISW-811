# Setup a Database Connection

1.  Debemos agragar nuestra configuración de nuestra base de datos en el archivo .env

    ```bash
        DB_CONNECTION=mysql
        DB_HOST=127.0.0.1
        DB_PORT=3306
        DB_DATABASE=laravel
        DB_USERNAME=laravel
        DB_PASSWORD=laravel
    ```

    ![alt](../img/16.png "Setup a Database Connection")

2.  Los datos que teniamos en las ruta web.php los pasamos a la base de datos
    ![alt](../img/17.png "Setup a Database Connection")

3.  Agregamos una nueva ruta esta se encargara de enlazar con el controlador para mostrar los datos

    ![alt](../img/18.png "Setup a Database Connection")

4.  Dentro del PostController creamos una funcion show en cual será la encargada de traerme los datos de la base datos

    ```php
     $post = \DB::table('post')->where('slug', $slug)->first();
    ```

    ![alt](../img/19.png "Setup a Database Connection")

5.  Creamos nuestra vista post.blade.php

    ![alt](../img/22.png "Setup a Database Connection")

6.  Verificamos que los datos se hayan extraido exitosamente

    ![alt](../img/20.png "Setup a Database Connection")

    #### Nota: Debemos quitar la linea dd($post) para que nos muestre el contenido de nuestro archivo post.blade.php

    ![alt](../img/21.png "Setup a Database Connection")

[Regresar al menu data base access](./menuDbAccess.md)
