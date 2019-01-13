defmodule Musicapp.Artist do
    use Ecto.Schema

    #@derive {Jason.Encoder, except: [:__meta__, :__struct__]}

    schema "artists" do
        field :name, :string
        timestamps()
        has_many :albums, Musicapp.Album
    end


end