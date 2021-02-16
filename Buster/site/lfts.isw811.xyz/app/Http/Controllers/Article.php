<?php

use App\Http\Controller;

use App\Article;
use Illuminate\Auth\Events\Validated;

class ArticlesController extends Controller
{
    public function index()
    {
        $article = Article::lastest()->get();
        return view('articles.index', ['articles' => $article]);
    }

    public function show($id)
    {
        $article = Article::findOrFail($id);
        return view('articles.show', ['articles' => $article]);
    }

    public function create()
    {
        return view('articles.create');
    }
    public function store()
    {
        Article::create([
            'title' => request('title'),
            'excerpt' => request('excerpt'),
            'body' => request('body')
        ]);
        return redirect('/articles');
    }
    public function edit($id)
    {
        $article = Article::find($id);

        return view('articles.edit', compact('article'));
    }
    public function update(Article $article)
    {

        $article->update($this->validate());

        return redirect('/articles/' . $article->id);
    }

    public function validate()
    {
        return request()->validate([
            'title' => 'require',
            'excerpt' => 'require',
            'body' => 'require'
        ]);
    }
}
