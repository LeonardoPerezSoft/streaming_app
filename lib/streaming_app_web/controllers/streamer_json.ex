defmodule StreamingAppWeb.StreamerJSON do
  alias StreamingApp.Streamers.Streamer

  @doc """
  Renders a list of streamers.
  """
  def index(%{streamers: streamers}) do
    %{data: for(streamer <- streamers, do: data(streamer))}
  end

  @doc """
  Renders a single streamer.
  """
  def show(%{streamer: streamer}) do
    %{data: data(streamer)}
  end

  defp data(%Streamer{} = streamer) do

    movies = case is_list(streamer.movies) do
    false->[]
    true -> streamer.movies
     #movies = [streamer.movies]
    |> Enum.map(& Map.from_struct(&1))
    |> Enum.map(& Enum.reduce([:__meta__, :streamer, :actors, :movies, :inserted_at, :updated_at],
     &1, fn key, acc -> Map.delete(acc,key)end))
    |> List.first
    end

    %{
      id: streamer.id,
      nombre: streamer.nombre,
      url: streamer.url,
      movies: movies
    }
  end
end
