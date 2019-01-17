# Musicapp

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `musicapp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:musicapp, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/musicapp](https://hexdocs.pm/musicapp).

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
•	Elixir: installation guide.
•	PostgreSQL: installation guide.

And following dependencies:
•	Ecto: see documentation here.
•	Plug: specification for composable modules between web applications and connection adapter for HTTP server Cowboy. See documentation here.
•	Cowboy: HTTP Server. See documentation here.
•	Jason: JSON implementation. See documentation here.



