defmodule Musicapp.Album do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :__struct__]}

    schema "albums" do
        field :title, :string
        field :tracks, :integer
        timestamps()
        belongs_to :artist, Musicapp.Artist
    end

    def changeset(struct, params) do
        struct
            |> cast(params, [:title, :tracks, :artist_id])
            |> validate_required([:title])
    end
end
