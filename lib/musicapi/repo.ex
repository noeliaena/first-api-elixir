defmodule MusicApi.Repo do
  use Ecto.Repo,
    otp_app: :musicapi,
    adapter: Ecto.Adapters.Postgres
end
