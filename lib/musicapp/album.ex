defmodule Musicapp.Album do
    use Ecto.Schema

    #@derive {Jason.Encoder, except: [:__meta__, :__struct__]}

    schema "albums" do
        field :title, :string
        field :tracks, :integer
        timestamps()
        belongs_to :artist, Musicapp.Artist
    end

end
