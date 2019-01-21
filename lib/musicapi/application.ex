defmodule MusicApi.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: MusicApi.Endpoint,
       options: [port: Application.get_env(:musicapi, :port)]},
      {MusicApi.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: MusicApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  Postgrex.Types.define(
    MusicApi.PostgresTypes,
    [] ++ Ecto.Adapters.Postgres.extensions(),
    json: Jason
  )
end
