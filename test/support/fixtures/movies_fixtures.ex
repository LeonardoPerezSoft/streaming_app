defmodule StreamingApp.MoviesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingApp.Movies` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        año: 42,
        director: "some director",
        genero: "some genero",
        nombre: "some nombre"
      })
      |> StreamingApp.Movies.create_movie()

    movie
  end
end
