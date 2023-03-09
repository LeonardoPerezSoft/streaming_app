defmodule StreamingApp.DirectorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingApp.Directors` context.
  """

  @doc """
  Generate a director.
  """
  def director_fixture(attrs \\ %{}) do
    {:ok, director} =
      attrs
      |> Enum.into(%{
        apellido: "some apellido",
        edad: 42,
        fecha_nac: ~D[2023-03-08],
        nombre: "some nombre"
      })
      |> StreamingApp.Directors.create_director()

    director
  end
end
