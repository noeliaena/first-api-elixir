defmodule Musicapp.Schemas.Album do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :title, :tracks, :artist, :inserted_at, :updated_at]}

  schema "albums" do
    field(:title, :string)
    field(:tracks, :integer)

    timestamps()

    belongs_to(:artist, Musicapp.Schemas.Artist)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:title, :tracks, :artist_id])
    |> validate_required([:title])
  end
end
