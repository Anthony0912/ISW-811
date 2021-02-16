# CSRF Attacks, With Examples

1.  En nuestro archivo web.php añadimos el siguente codigo el cual nos permitira cerra la session

    ```PHP
    Route::get('/logout', function () {
    auth()->logout();
    return 'You are now logout out';

    });
    ```

2.  Laravel proporciona protección contra la falsificación de solicitudes entre sitios (CSRF) lista para usar, pero es posible que aún no sepa exactamente lo que eso significa. En esta lección, le mostraré algunos ejemplos de cómo se ejecuta un ataque CSRF, así como de cómo Laravel protege su aplicación contra ellos.

[Regresar al menu Core Concepts](./menuCore.md)
