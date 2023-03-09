defmodule StreamingAppWeb.Movie_ActorController do
  use StreamingAppWeb, :controller

  alias StreamingApp.Movies_Actors
  alias StreamingApp.Movies_Actors.Movie_Actor

  action_fallback StreamingAppWeb.FallbackController

  def index(conn, _params) do
    movies_actors = Movies_Actors.list_movies_actors()
    render(conn, :index, movies_actors: movies_actors)
  end

  def create(conn, %{"movie__actor" => movie__actor_params}) do
    with {:ok, %Movie_Actor{} = movie__actor} <- Movies_Actors.create_movie__actor(movie__actor_params) do
      conn
      |> put_status(:created)
     # |> put_resp_header("location", ~p"/api/movies_actors/#{movie__actor}")
      |> render(:show, movie__actor: movie__actor)
    end
  end

  def show(conn, %{"id" => id}) do
    movie__actor = Movies_Actors.get_movie__actor!(id)
    render(conn, :show, movie__actor: movie__actor)
  end

  def update(conn, %{"id" => id, "movie__actor" => movie__actor_params}) do
    movie__actor = Movies_Actors.get_movie__actor!(id)

    with {:ok, %Movie_Actor{} = movie__actor} <- Movies_Actors.update_movie__actor(movie__actor, movie__actor_params) do
      render(conn, :show, movie__actor: movie__actor)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie__actor = Movies_Actors.get_movie__actor!(id)

    with {:ok, %Movie_Actor{}} <- Movies_Actors.delete_movie__actor(movie__actor) do
      send_resp(conn, :no_content, "")
    end
  end
end
