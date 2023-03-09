defmodule StreamingAppWeb.ActorController do
  use StreamingAppWeb, :controller

  alias StreamingApp.Actors
  alias StreamingApp.Actors.Actor

  action_fallback StreamingAppWeb.FallbackController

  def index(conn, _params) do
    actors = Actors.list_actors()
    render(conn, :index, actors: actors)
  end

  def create(conn, %{"actor" => actor_params}) do
    with {:ok, %Actor{} = actor} <- Actors.create_actor(actor_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/actors/#{actor}")
      |> render(:show, actor: actor)
    end
  end

  def show(conn, %{"id" => id}) do
    actor = Actors.get_actor!(id)
    render(conn, :show, actor: actor)
  end

  def update(conn, %{"id" => id, "actor" => actor_params}) do
    actor = Actors.get_actor!(id)

    with {:ok, %Actor{} = actor} <- Actors.update_actor(actor, actor_params) do
      render(conn, :show, actor: actor)
    end
  end

  def delete(conn, %{"id" => id}) do
    actor = Actors.get_actor!(id)

    with {:ok, %Actor{}} <- Actors.delete_actor(actor) do
      send_resp(conn, :no_content, "")
    end
  end
end
