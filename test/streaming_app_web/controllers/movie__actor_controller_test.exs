defmodule StreamingAppWeb.Movie_ActorControllerTest do
  use StreamingAppWeb.ConnCase

  import StreamingApp.Movies_ActorsFixtures

  alias StreamingApp.Movies_Actors.Movie_Actor

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all movies_actors", %{conn: conn} do
      conn = get(conn, ~p"/api/movies_actors")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create movie__actor" do
    test "renders movie__actor when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/movies_actors", movie__actor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/movies_actors/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/movies_actors", movie__actor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update movie__actor" do
    setup [:create_movie__actor]

    test "renders movie__actor when data is valid", %{conn: conn, movie__actor: %Movie_Actor{id: id} = movie__actor} do
      conn = put(conn, ~p"/api/movies_actors/#{movie__actor}", movie__actor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/movies_actors/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, movie__actor: movie__actor} do
      conn = put(conn, ~p"/api/movies_actors/#{movie__actor}", movie__actor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete movie__actor" do
    setup [:create_movie__actor]

    test "deletes chosen movie__actor", %{conn: conn, movie__actor: movie__actor} do
      conn = delete(conn, ~p"/api/movies_actors/#{movie__actor}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/movies_actors/#{movie__actor}")
      end
    end
  end

  defp create_movie__actor(_) do
    movie__actor = movie__actor_fixture()
    %{movie__actor: movie__actor}
  end
end
