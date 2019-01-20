defmodule Musicapp.Endpoint do
  use Plug.Router
  use Plug.ErrorHandler

  alias Musicapp.Managers.Album
  alias Musicapp.Managers.Artist

  plug(:match)
  plug(:dispatch)

  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)

  get "/api/artists" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(Artist.list_artists))
  end

  get "/api/artists/:id" do
    artist = Artist.get_artist(conn.path_params["id"])

    if is_nil(artist) do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(404, missing_artist(conn.path_params["id"]))
    else
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(artist))
    end
  end

  post "/api/artists" do
    {:ok, body, conn} = Plug.Conn.read_body(conn)
    IO.inspect(Jason.decode!(body))

    #new_artist =
    #  Musicapp.Schemas.Artist.changeset(%Musicapp.Schemas.Artist{}, Jason.decode!(body))
    #  |> Repo.insert!()

    new_artist = Artist.create_artist(Jason.decode!(body))

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Jason.encode!(new_artist))
  end

  delete "/api/artists/:id" do
    artist = Artist.get_artist(conn.path_params["id"])

    if is_nil(artist) do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(404, missing_artist(conn.path_params["id"]))
    else
      Artist.delete_artist(artist)

      conn
      |> send_resp(204, "")
    end
  end

  get "/api/albums" do
    # En params tienes todos los parámetros de la query
    #  params["title"] => "titulo 2"
    %{query_params: params} = Plug.Conn.fetch_query_params(conn)

    albums = Album.list_albums

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(albums))
  end

  get "/api/albums/:id" do
    album = Album.get_album(conn.path_params["id"])

    if is_nil(album) do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(404, missing_album(conn.path_params["id"]))
    else
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(album))
    end
  end

  post "/api/albums" do
    {:ok, body, conn} = Plug.Conn.read_body(conn)

    #new_album =
    #  Musicapp.Schemas.Album.changeset(%Musicapp.Schemas.Album{}, Jason.decode!(body))
    #  |> Musicapp.Repo.preload(:artist)
    #  |> Musicapp.Repo.insert!()
    new_album = Album.create_album(Jason.decode!(body))

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Jason.encode!(new_album))
  end

  delete "/api/albums/:id" do
    album = Album.get_album(conn.path_params["id"])

    if is_nil(album) do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(404, missing_album(conn.path_params["id"]))
    else
      Album.delete_album(album)

      conn
      |> send_resp(204, "")
    end
  end

  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{:message => "Not Found"}))
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(conn.status, Jason.encode!(%{:message => "Unexcepted error"}))
  end

  defp missing_artist(id) do
    Jason.encode!(%{:error => "The artist with id " <> id <> " does not exist"})
  end

  defp missing_album(id) do
    Jason.encode!(%{:error => "The album with id " <> id <> " does not exist"})
  end
end
