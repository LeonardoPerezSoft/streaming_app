defmodule StreamingApp.Movies_Actors do
  @moduledoc """
  The Movies_Actors context.
  """

  import Ecto.Query, warn: false
  alias StreamingApp.Repo

  alias StreamingApp.Movies_Actors.Movie_Actor

  @doc """
  Returns the list of movies_actors.

  ## Examples

      iex> list_movies_actors()
      [%Movie_Actor{}, ...]

  """
  def list_movies_actors do
    Repo.all(Movie_Actor)
  end

  @doc """
  Gets a single movie__actor.

  Raises `Ecto.NoResultsError` if the Movie  actor does not exist.

  ## Examples

      iex> get_movie__actor!(123)
      %Movie_Actor{}

      iex> get_movie__actor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie__actor!(id), do: Repo.get!(Movie_Actor, id)

  @doc """
  Creates a movie__actor.

  ## Examples

      iex> create_movie__actor(%{field: value})
      {:ok, %Movie_Actor{}}

      iex> create_movie__actor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie__actor(attrs \\ %{}) do
    %Movie_Actor{}
    |> Movie_Actor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie__actor.

  ## Examples

      iex> update_movie__actor(movie__actor, %{field: new_value})
      {:ok, %Movie_Actor{}}

      iex> update_movie__actor(movie__actor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie__actor(%Movie_Actor{} = movie__actor, attrs) do
    movie__actor
    |> Movie_Actor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movie__actor.

  ## Examples

      iex> delete_movie__actor(movie__actor)
      {:ok, %Movie_Actor{}}

      iex> delete_movie__actor(movie__actor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie__actor(%Movie_Actor{} = movie__actor) do
    Repo.delete(movie__actor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie__actor changes.

  ## Examples

      iex> change_movie__actor(movie__actor)
      %Ecto.Changeset{data: %Movie_Actor{}}

  """
  def change_movie__actor(%Movie_Actor{} = movie__actor, attrs \\ %{}) do
    Movie_Actor.changeset(movie__actor, attrs)
  end
end
