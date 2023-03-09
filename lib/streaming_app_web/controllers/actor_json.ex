defmodule StreamingAppWeb.ActorJSON do
  alias StreamingApp.Actors.Actor

  @doc """
  Renders a list of actors.
  """
  def index(%{actors: actors}) do
    %{data: for(actor <- actors, do: data(actor))}
  end

  @doc """
  Renders a single actor.
  """
  def show(%{actor: actor}) do
    %{data: data(actor)}
  end

  defp data(%Actor{} = actor) do

     movies = case is_list(actor.movies) do

     false->[]
      true -> actor.movies

   #movies = actor.movies
   |> Enum.map(& Map.from_struct(&1))
   |> Enum.map(& Enum.reduce([:__meta__,  :streamer, :streamer_id, :movies, :genero, :inserted_at, :updated_at],
   &1, fn key, acc -> Map.delete(acc, key) end))
   #|> List.first


    end
    %{
      id: actor.id,
      nombre: actor.nombre,
      apellido: actor.apellido,
      nacionalidad: actor.nacionalidad,
      fecha_nac: actor.fecha_nac,
      edad: actor.edad,
      movies: movies
    }
  end
end
