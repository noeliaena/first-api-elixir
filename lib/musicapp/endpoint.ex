defmodule Musicapp.Endpoint do
  use Plug.Router
  use Plug.ErrorHandler

  alias Musicapp.Repo
  alias Musicapp.Artist
  alias Musicapp.Album

  plug(:match)
  plug(:dispatch)

  plug Plug.Parsers, parsers: [:json], json_decoder: Jason

  get "/api/artists" do
    conn 
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(Repo.all(Artist)))
  end

  get "/api/artists/:id" do
    artist = Repo.get(Artist, conn.path_params["id"])
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
    IO.inspect Jason.decode!(body)
    
    new_artist = Artist.changeset(%Artist{}, Jason.decode!(body))
      |> Repo.insert!()

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, Jason.encode!(new_artist))
  end

  delete "/api/artists/:id" do
    artist = Repo.get(Artist, conn.path_params["id"])
    if is_nil(artist) do
      conn 
        |> put_resp_content_type("application/json")
        |> send_resp(404, missing_artist(conn.path_params["id"]))
    else
      Repo.delete(artist)
      conn 
        |> send_resp(204, "")
    end
  end

  get "/api/albums" do
    conn 
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(Repo.preload(Repo.all(Album), :artist)))
  end

  get "/api/albums/:id" do
    album = Repo.get(Album, conn.path_params["id"])
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
    IO.inspect Jason.decode!(body)
    
    new_album = Album.changeset(%Album{}, Jason.decode!(body))
      |> Repo.preload(:artist)
      |> Repo.insert!()

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, Jason.encode!(new_album))
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
    Jason.encode!(%{:error => "The artist with id "<>id<>" does not exist"})
  end

  defp missing_album(id) do 
    Jason.encode!(%{:error => "The album with id "<>id<>" does not exist"})
  end
end