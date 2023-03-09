defmodule StreamingAppWeb.MovieJSON do
  alias StreamingApp.Movies.Movie

  @doc """
  Renders a list of movies.
  """
  def index(%{movies: movies}) do
    %{data: for(movie <- movies, do: data(movie))}
  end

  @doc """
  Renders a single movie.
  """
  def show(%{movie: movie}) do
    %{data: data(movie)}
  end

  defp data(%Movie{} = movie) do
      #traer el streamer


      streamer = case is_list(movie.streamer) do
       false-> []
       true -> [movie.streamer]
    # streamer = [movie.streamer]
     |> Enum.map(& Map.from_struct(&1))
     |> Enum.map(& Enum.reduce([:__meta__, :streamer, :streamer_id, :actors, :inserted_at, :updated_at, :movies],
     &1, fn key, acc -> Map.delete(acc,key)end))
     |> List.first
      end



     actors = case is_list(movie.actors) do
       false->[]
       true -> movie.actors
       #actors = movie.actors
      |> Enum.map(& Map.from_struct(&1))
      |> Enum.map(& Enum.reduce([:__meta__, :movies, :inserted_at, :updated_at],
       &1, fn key, acc -> Map.delete(acc, key) end))
      #|> List.first
      end


      %{
      id: movie.id,
      nombre: movie.nombre,
      año: movie.año,
      director: movie.director,
      genero: movie.genero,
      streamer: streamer,
      actors: actors


    }
  end
end
