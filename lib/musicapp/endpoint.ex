defmodule Musicapp.Endpoint do
  use Plug.Router
  use Plug.ErrorHandler
  
  plug(:match)
  plug(:dispatch)

  plug Plug.Parsers, parsers: [:json], json_decoder: Jason

  get "/hello" do
    send_resp(conn, 200, "Hello, world!")
  end

  get "/api/artists" do
    IO.puts inspect conn
    conn 
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(Musicapp.Repo.all(Musicapp.Artist)))
  end

  get "/api/artists/:id" do
    conn = put_resp_content_type(conn, "application/json")
    artist = Musicapp.Repo.get(Musicapp.Artist, conn.path_params["id"])
    if is_nil(artist) do
      send_resp(conn, 404, "{\"error\": \"The artist with id "<>conn.path_params["id"]<>" does not exist\"}")
    else
      send_resp(conn, 200, Jason.encode!(artist))
    end
  end

  post "/api/artists" do
    send_resp(conn, 200, "Success")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(conn.status, "{\"error\": \"Unexcepted error\"}")
  end
end