# First API with Elixir

In this repository it will be the code to create an API Elixir. We're going to implement a simple RESTful API with Elixir and Ecto for database management.
View the slides here.

## Design API

Our API serves albums and artists as resources, defining a very simple Music Store. 

The endpoints will be:
-	GET 	    /api/artists
-	GET 	    /api/artists/{id}
-	POST 	    /api/artists
-	DELETE   /api/artists/{id}

-	GET 	    /api/albums
-	GET        /api/albums/{id}
-	POST      /api/albums
-	DELETE   /api/albums/{id}

## Environment Setup

We'll need to install:
- Elixir
  - Mac: `brew install elixir`
  - Windows: [download the installer](https://elixir-lang.org/install.html#windows)
  - Linux: [check your distribution and download the installer](https://elixir-lang.org/install.html#unix-and-unix-like)
  
- PostgreSQL
  - Mac: [download Postgres.app](https://postgresapp.com/)
  - Windows & Linux: [download](https://www.postgresql.org/download/)

And following dependencies:
-	Ecto: see documentation [here](http://hexdocs.pm/ecto).
- Postgrex: adapter for Postgres. See documentation [here](hhttp://hexdocs.pm/postgrex).
-	Plug: specification for composable modules between web applications and connection adapters. See documentation [here](http://hexdocs.pm/plug).
-	Cowboy: HTTP Server. See documentation [here](http://hexdocs.pm/plug_cowboy).
-	Jason: JSON implementation. See documentation [here](http://hexdocs.pm/jason).

## Running it!
  * Install dependencies with `mix deps.get`
  * Create and migrate your database (check credentials on config.exs) with `mix ecto.create && mix ecto.migrate`
  * Start endpoint with `mix run --no-halt`

You can try each service with Postman or curl in [localhost:4000](http://localhost:4000).
