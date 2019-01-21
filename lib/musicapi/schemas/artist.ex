defmodule MusicApi.Schemas.Artist do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :inserted_at, :updated_at]}

  schema "artists" do
    field(:name, :string)

    timestamps()
    
    has_many(:albums, MusicApi.Schemas.Album)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
