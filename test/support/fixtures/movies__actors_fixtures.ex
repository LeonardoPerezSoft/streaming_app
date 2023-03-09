defmodule StreamingApp.Movies_ActorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingApp.Movies_Actors` context.
  """

  @doc """
  Generate a movie__actor.
  """
  def movie__actor_fixture(attrs \\ %{}) do
    {:ok, movie__actor} =
      attrs
      |> Enum.into(%{

      })
      |> StreamingApp.Movies_Actors.create_movie__actor()

    movie__actor
  end
end
