defmodule StreamingApp.Streamers do
  @moduledoc """
  The Streamers context.
  """

  import Ecto.Query, warn: false
  alias StreamingApp.Repo

  alias StreamingApp.Streamers.Streamer

  @doc """
  Returns the list of streamers.

  ## Examples

      iex> list_streamers()
      [%Streamer{}, ...]

  """
  def list_streamers do
    Repo.all(Streamer) |> Repo.preload(:movies)
  end

  @doc """
  Gets a single streamer.

  Raises `Ecto.NoResultsError` if the Streamer does not exist.

  ## Examples

      iex> get_streamer!(123)
      %Streamer{}

      iex> get_streamer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_streamer!(id), do: Repo.get!(Streamer, id) |>Repo.preload(:movies)

  @doc """
  Creates a streamer.

  ## Examples

      iex> create_streamer(%{field: value})
      {:ok, %Streamer{}}

      iex> create_streamer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_streamer(attrs \\ %{}) do
    %Streamer{}
    |> Streamer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a streamer.

  ## Examples

      iex> update_streamer(streamer, %{field: new_value})
      {:ok, %Streamer{}}

      iex> update_streamer(streamer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_streamer(%Streamer{} = streamer, attrs) do
    streamer
    |> Streamer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a streamer.

  ## Examples

      iex> delete_streamer(streamer)
      {:ok, %Streamer{}}

      iex> delete_streamer(streamer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_streamer(%Streamer{} = streamer) do
    Repo.delete(streamer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking streamer changes.

  ## Examples

      iex> change_streamer(streamer)
      %Ecto.Changeset{data: %Streamer{}}

  """
  def change_streamer(%Streamer{} = streamer, attrs \\ %{}) do
    Streamer.changeset(streamer, attrs)
  end

  #def index_by_streamer(%{Streamer_id => streamer_id}) do
    #movies = Repo.all(from m in Movie, where: m.streamer_id == streamer_id)
  #end

end
