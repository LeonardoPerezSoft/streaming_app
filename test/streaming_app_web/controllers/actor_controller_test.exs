defmodule StreamingAppWeb.ActorControllerTest do
  use StreamingAppWeb.ConnCase

  import StreamingApp.ActorsFixtures

  alias StreamingApp.Actors.Actor

  @create_attrs %{
    apellidop: "some apellidop",
    edad: 42,
    fecha_nac: ~D[2023-03-06],
    nacionalidad: "some nacionalidad",
    nombre: "some nombre"
  }
  @update_attrs %{
    apellidop: "some updated apellidop",
    edad: 43,
    fecha_nac: ~D[2023-03-07],
    nacionalidad: "some updated nacionalidad",
    nombre: "some updated nombre"
  }
  @invalid_attrs %{apellidop: nil, edad: nil, fecha_nac: nil, nacionalidad: nil, nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all actors", %{conn: conn} do
      conn = get(conn, ~p"/api/actors")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create actor" do
    test "renders actor when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/actors", actor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/actors/#{id}")

      assert %{
               "id" => ^id,
               "apellidop" => "some apellidop",
               "edad" => 42,
               "fecha_nac" => "2023-03-06",
               "nacionalidad" => "some nacionalidad",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/actors", actor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update actor" do
    setup [:create_actor]

    test "renders actor when data is valid", %{conn: conn, actor: %Actor{id: id} = actor} do
      conn = put(conn, ~p"/api/actors/#{actor}", actor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/actors/#{id}")

      assert %{
               "id" => ^id,
               "apellidop" => "some updated apellidop",
               "edad" => 43,
               "fecha_nac" => "2023-03-07",
               "nacionalidad" => "some updated nacionalidad",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, actor: actor} do
      conn = put(conn, ~p"/api/actors/#{actor}", actor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete actor" do
    setup [:create_actor]

    test "deletes chosen actor", %{conn: conn, actor: actor} do
      conn = delete(conn, ~p"/api/actors/#{actor}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/actors/#{actor}")
      end
    end
  end

  defp create_actor(_) do
    actor = actor_fixture()
    %{actor: actor}
  end
end
