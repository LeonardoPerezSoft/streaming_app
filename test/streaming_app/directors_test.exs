defmodule StreamingApp.DirectorsTest do
  use StreamingApp.DataCase

  alias StreamingApp.Directors

  describe "directors" do
    alias StreamingApp.Directors.Director

    import StreamingApp.DirectorsFixtures

    @invalid_attrs %{apellido: nil, edad: nil, fecha_nac: nil, nombre: nil}

    test "list_directors/0 returns all directors" do
      director = director_fixture()
      assert Directors.list_directors() == [director]
    end

    test "get_director!/1 returns the director with given id" do
      director = director_fixture()
      assert Directors.get_director!(director.id) == director
    end

    test "create_director/1 with valid data creates a director" do
      valid_attrs = %{apellido: "some apellido", edad: 42, fecha_nac: ~D[2023-03-08], nombre: "some nombre"}

      assert {:ok, %Director{} = director} = Directors.create_director(valid_attrs)
      assert director.apellido == "some apellido"
      assert director.edad == 42
      assert director.fecha_nac == ~D[2023-03-08]
      assert director.nombre == "some nombre"
    end

    test "create_director/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directors.create_director(@invalid_attrs)
    end

    test "update_director/2 with valid data updates the director" do
      director = director_fixture()
      update_attrs = %{apellido: "some updated apellido", edad: 43, fecha_nac: ~D[2023-03-09], nombre: "some updated nombre"}

      assert {:ok, %Director{} = director} = Directors.update_director(director, update_attrs)
      assert director.apellido == "some updated apellido"
      assert director.edad == 43
      assert director.fecha_nac == ~D[2023-03-09]
      assert director.nombre == "some updated nombre"
    end

    test "update_director/2 with invalid data returns error changeset" do
      director = director_fixture()
      assert {:error, %Ecto.Changeset{}} = Directors.update_director(director, @invalid_attrs)
      assert director == Directors.get_director!(director.id)
    end

    test "delete_director/1 deletes the director" do
      director = director_fixture()
      assert {:ok, %Director{}} = Directors.delete_director(director)
      assert_raise Ecto.NoResultsError, fn -> Directors.get_director!(director.id) end
    end

    test "change_director/1 returns a director changeset" do
      director = director_fixture()
      assert %Ecto.Changeset{} = Directors.change_director(director)
    end
  end
end
