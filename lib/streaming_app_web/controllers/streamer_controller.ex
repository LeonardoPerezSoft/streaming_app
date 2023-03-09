defmodule StreamingAppWeb.StreamerController do
  use StreamingAppWeb, :controller

  alias StreamingApp.Streamers
  alias StreamingApp.Streamers.Streamer

  action_fallback StreamingAppWeb.FallbackController

  def index(conn, _params) do
    streamers = Streamers.list_streamers()
    render(conn, :index, streamers: streamers)
  end

  def create(conn, %{"streamer" => streamer_params}) do
    with {:ok, %Streamer{} = streamer} <- Streamers.create_streamer(streamer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/streamers/#{streamer}")
      |> render(:show, streamer: streamer)
    end
  end

  def show(conn, %{"id" => id}) do
    streamer = Streamers.get_streamer!(id)
    render(conn, :show, streamer: streamer)
  end

  def update(conn, %{"id" => id, "streamer" => streamer_params}) do
    streamer = Streamers.get_streamer!(id)

    with {:ok, %Streamer{} = streamer} <- Streamers.update_streamer(streamer, streamer_params) do
      render(conn, :show, streamer: streamer)
    end
  end

  def delete(conn, %{"id" => id}) do
    streamer = Streamers.get_streamer!(id)

    with {:ok, %Streamer{}} <- Streamers.delete_streamer(streamer) do
      send_resp(conn, :no_content, "")
    end
  end
end
