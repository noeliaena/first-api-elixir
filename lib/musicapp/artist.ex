defmodule Musicapp.Artist do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :__struct__, :albums]}

    schema "artists" do
        field :name, :string
        timestamps()
        has_many :albums, Musicapp.Album
    end

    def changeset(struct, params) do
        struct
            |> cast(params, [:name])
            |> validate_required([:name])
    end
end