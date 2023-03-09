defmodule StreamingApp.ActorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingApp.Actors` context.
  """

  @doc """
  Generate a actor.
  """
  def actor_fixture(attrs \\ %{}) do
    {:ok, actor} =
      attrs
      |> Enum.into(%{
        apellidop: "some apellidop",
        edad: 42,
        fecha_nac: ~D[2023-03-06],
        nacionalidad: "some nacionalidad",
        nombre: "some nombre"
      })
      |> StreamingApp.Actors.create_actor()

    actor
  end
end
