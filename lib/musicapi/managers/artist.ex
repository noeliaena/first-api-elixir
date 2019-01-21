defmodule MusicApi.Managers.Artist do
  import Ecto.Query, warn: false

  alias MusicApi.Schemas.Artist
  alias MusicApi.Repo

  @doc """
  Returns the list of artists.

  ## Examples

      iex> list_artists()
      [%Artist{}, ...]

  """
  def list_artists do
    Repo.all(Artist)
  end

  @doc """
  Gets a single artist.

  ## Examples

      iex> get_artist!(1)
      %Artist{}

  """
  def get_artist(id), do: Repo.get(Artist, id)

  @doc """
  Gets a single artist by name.

  Returns nil if the Artist does not exist.

  ## Examples

      iex> get_artist_by_name("somename")
      %Artist{}

      iex> get_artist_by_name("somename")
      nil

  """
  def get_artist_by_name(name) do
    from(a in Artist, where: a.name == ^name)
    |> Repo.one()
  end

  @doc """
  Creates an artist.

  ## Examples

      iex> create_artist(%{field: value})
      {:ok, %Artist{}}

      iex> create_artist(%{field: badvalue})
      {:error, %Ecto.Changeset{}}

  """
  def create_artist(attrs \\ %{}) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Deletes an Artist.

  ## Examples

      iex> delete_artist(artist)
      {:ok, %Artist{}}

      iex> delete_artist(artist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_artist(%Artist{} = artist) do
    Repo.delete(artist)
  end
end