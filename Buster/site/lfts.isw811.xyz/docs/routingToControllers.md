# Routing to Controllers

1. Creamos la ruta donde estara apuntando la vista hacia nuestro controlador
   ![alt](./img/13.png "Routing to Controllers")
1. Creamos nuestro controlador con el siguente código

```bash
    class PostsController
    {
        public function show($post)
        {
            $posts =  [
                'my-firts-post' => 'Hello, this is my first blog post!',
                'my-second-post' => 'Now i am getting the hang of this blogging thing.'
            ];
            if (!array_key_exists($post, $posts)) {
                abort(404, 'Sorry, that post was not found');
            }
            return view('post', [
                'post' => $posts[$post],
            ]);
        }
    }

```

![alt](./img/14.png "Routing to Controllers")

5.Este seria el resultado
![alt](./img/15.png "Routing to Controllers")
