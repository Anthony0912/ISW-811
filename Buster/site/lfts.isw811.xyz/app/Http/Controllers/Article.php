<?php

use App\Http\Controller;

use App\Article;

class ArticlesController extends Controller
{
    public function index()
    {
        $articles = Article::lastest()->get();
        return view('articles.index', ['articles' => $articles]);
    }

    public function show($id)
    {
        $articles = Article::find($id);
        return view('articles.index', ['articles' => $articles]);
    }

    public function create()
    {
    }
    public function store()
    {
    }
    public function edit()
    {
    }
    public function update()
    {
    }
}
