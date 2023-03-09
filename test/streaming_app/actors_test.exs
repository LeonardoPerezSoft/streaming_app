defmodule StreamingApp.ActorsTest do
  use StreamingApp.DataCase

  alias StreamingApp.Actors

  describe "actors" do
    alias StreamingApp.Actors.Actor

    import StreamingApp.ActorsFixtures

    @invalid_attrs %{apellidop: nil, edad: nil, fecha_nac: nil, nacionalidad: nil, nombre: nil}

    test "list_actors/0 returns all actors" do
      actor = actor_fixture()
      assert Actors.list_actors() == [actor]
    end

    test "get_actor!/1 returns the actor with given id" do
      actor = actor_fixture()
      assert Actors.get_actor!(actor.id) == actor
    end

    test "create_actor/1 with valid data creates a actor" do
      valid_attrs = %{apellidop: "some apellidop", edad: 42, fecha_nac: ~D[2023-03-06], nacionalidad: "some nacionalidad", nombre: "some nombre"}

      assert {:ok, %Actor{} = actor} = Actors.create_actor(valid_attrs)
      assert actor.apellidop == "some apellidop"
      assert actor.edad == 42
      assert actor.fecha_nac == ~D[2023-03-06]
      assert actor.nacionalidad == "some nacionalidad"
      assert actor.nombre == "some nombre"
    end

    test "create_actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Actors.create_actor(@invalid_attrs)
    end

    test "update_actor/2 with valid data updates the actor" do
      actor = actor_fixture()
      update_attrs = %{apellidop: "some updated apellidop", edad: 43, fecha_nac: ~D[2023-03-07], nacionalidad: "some updated nacionalidad", nombre: "some updated nombre"}

      assert {:ok, %Actor{} = actor} = Actors.update_actor(actor, update_attrs)
      assert actor.apellidop == "some updated apellidop"
      assert actor.edad == 43
      assert actor.fecha_nac == ~D[2023-03-07]
      assert actor.nacionalidad == "some updated nacionalidad"
      assert actor.nombre == "some updated nombre"
    end

    test "update_actor/2 with invalid data returns error changeset" do
      actor = actor_fixture()
      assert {:error, %Ecto.Changeset{}} = Actors.update_actor(actor, @invalid_attrs)
      assert actor == Actors.get_actor!(actor.id)
    end

    test "delete_actor/1 deletes the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{}} = Actors.delete_actor(actor)
      assert_raise Ecto.NoResultsError, fn -> Actors.get_actor!(actor.id) end
    end

    test "change_actor/1 returns a actor changeset" do
      actor = actor_fixture()
      assert %Ecto.Changeset{} = Actors.change_actor(actor)
    end
  end
end
