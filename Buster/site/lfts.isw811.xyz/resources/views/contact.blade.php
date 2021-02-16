@extends('layout')
@section('content')
    <h1>Hello world</h1>

    <a href="{{ router('articles.show', $article->id) }}">
        {{ $article->title }}
    </a>
@endsection
