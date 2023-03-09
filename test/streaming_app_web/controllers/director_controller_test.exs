defmodule StreamingAppWeb.DirectorControllerTest do
  use StreamingAppWeb.ConnCase

  import StreamingApp.DirectorsFixtures

  alias StreamingApp.Directors.Director

  @create_attrs %{
    apellido: "some apellido",
    edad: 42,
    fecha_nac: ~D[2023-03-08],
    nombre: "some nombre"
  }
  @update_attrs %{
    apellido: "some updated apellido",
    edad: 43,
    fecha_nac: ~D[2023-03-09],
    nombre: "some updated nombre"
  }
  @invalid_attrs %{apellido: nil, edad: nil, fecha_nac: nil, nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all directors", %{conn: conn} do
      conn = get(conn, ~p"/api/directors")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create director" do
    test "renders director when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/directors", director: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/directors/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some apellido",
               "edad" => 42,
               "fecha_nac" => "2023-03-08",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/directors", director: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update director" do
    setup [:create_director]

    test "renders director when data is valid", %{conn: conn, director: %Director{id: id} = director} do
      conn = put(conn, ~p"/api/directors/#{director}", director: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/directors/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some updated apellido",
               "edad" => 43,
               "fecha_nac" => "2023-03-09",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, director: director} do
      conn = put(conn, ~p"/api/directors/#{director}", director: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete director" do
    setup [:create_director]

    test "deletes chosen director", %{conn: conn, director: director} do
      conn = delete(conn, ~p"/api/directors/#{director}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/directors/#{director}")
      end
    end
  end

  defp create_director(_) do
    director = director_fixture()
    %{director: director}
  end
end
