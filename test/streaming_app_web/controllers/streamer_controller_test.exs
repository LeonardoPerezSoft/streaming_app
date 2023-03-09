defmodule StreamingAppWeb.StreamerControllerTest do
  use StreamingAppWeb.ConnCase

  import StreamingApp.StreamersFixtures

  alias StreamingApp.Streamers.Streamer

  @create_attrs %{
    nombre: "some nombre",
    url: "some url"
  }
  @update_attrs %{
    nombre: "some updated nombre",
    url: "some updated url"
  }
  @invalid_attrs %{nombre: nil, url: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all streamers", %{conn: conn} do
      conn = get(conn, ~p"/api/streamers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create streamer" do
    test "renders streamer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/streamers", streamer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/streamers/#{id}")

      assert %{
               "id" => ^id,
               "nombre" => "some nombre",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/streamers", streamer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update streamer" do
    setup [:create_streamer]

    test "renders streamer when data is valid", %{conn: conn, streamer: %Streamer{id: id} = streamer} do
      conn = put(conn, ~p"/api/streamers/#{streamer}", streamer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/streamers/#{id}")

      assert %{
               "id" => ^id,
               "nombre" => "some updated nombre",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, streamer: streamer} do
      conn = put(conn, ~p"/api/streamers/#{streamer}", streamer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete streamer" do
    setup [:create_streamer]

    test "deletes chosen streamer", %{conn: conn, streamer: streamer} do
      conn = delete(conn, ~p"/api/streamers/#{streamer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/streamers/#{streamer}")
      end
    end
  end

  defp create_streamer(_) do
    streamer = streamer_fixture()
    %{streamer: streamer}
  end
end
