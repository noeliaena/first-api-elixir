defmodule Musicapp.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Plug.Cowboy, scheme: :http, plug: Musicapp.Endpoint, options: [port: cowboy_port()]},
      {Musicapp.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Musicapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:musicapp, :cowboy_port, 4000)

  Postgrex.Types.define(Musicapp.PostgresTypes, [] ++ Ecto.Adapters.Postgres.extensions(), json: Jason)
end
