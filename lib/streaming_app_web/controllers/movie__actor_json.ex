defmodule StreamingAppWeb.Movie_ActorJSON do
  alias StreamingApp.Movies_Actors.Movie_Actor

  @doc """
  Renders a list of movies_actors.
  """
  def index(%{movies_actors: movies_actors}) do
    %{data: for(movie__actor <- movies_actors, do: data(movie__actor))}
  end

  @doc """
  Renders a single movie__actor.
  """
  def show(%{movie__actor: movie__actor}) do
    %{data: data(movie__actor)}
  end

  defp data(%Movie_Actor{} = movie__actor) do
    %{
      id: movie__actor.id
    }
  end
end
