defmodule StreamingApp.StreamersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StreamingApp.Streamers` context.
  """

  @doc """
  Generate a streamer.
  """
  def streamer_fixture(attrs \\ %{}) do
    {:ok, streamer} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre",
        url: "some url"
      })
      |> StreamingApp.Streamers.create_streamer()

    streamer
  end
end
