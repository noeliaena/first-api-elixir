defmodule Musicapp.Repo do
  use Ecto.Repo,
    otp_app: :musicapp,
    adapter: Ecto.Adapters.Postgres
end
