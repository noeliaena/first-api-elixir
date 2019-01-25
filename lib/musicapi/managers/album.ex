defmodule MusicApi.Managers.Album do
  import Ecto.Query, warn: false

  alias MusicApi.Schemas.Album
  alias MusicApi.Repo

  @doc """
  Returns the list of albums.

  ## Examples

      iex> list_albums()
      [%Album{}, ...]

  """
  def list_albums do
    Repo.all(Album)
    |> Repo.preload([:artist])
  end

  @doc """
  Gets a single album.

  ## Examples

      iex> get_album!(1)
      %Album{}

  """
  def get_album(id) do
    Repo.get(Album, id)
    |> Repo.preload([:artist])
  end

  @doc """
  Gets a single album by title.

  Returns nil if the album does not exist.

  ## Examples

      iex> get_albums_by_title("sometitle")
      %Album{}

      iex> get_albums_by_title("sometitle")
      nil

  """
  def get_albums_by_title(title) do
    from(a in Album, where: fragment("lower(?)", a.title) == ^title)
    |> Repo.all()
    |> Repo.preload([:artist])
  end

  @doc """
  Gets a single album by title.

  @doc """
  Creates an album.

  ## Examples

      iex> create_album(%{field: value})
      {:ok, %Album{}}

      iex> create_album(%{field: badvalue})
      {:error, %Ecto.Changeset{}}

  """
  def create_album(attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.preload(:artist)
    |> Repo.insert!()
  end

  @doc """
  Deletes an album.

  ## Examples

      iex> delete_album(album)
      {:ok, %Album{}}

      iex> delete_album(album)
      {:error, %Ecto.Changeset{}}

  """
  def delete_album(%Album{} = album) do
    Repo.delete(album)
  end
end
