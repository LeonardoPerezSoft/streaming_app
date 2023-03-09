defmodule StreamingApp.StreamersTest do
  use StreamingApp.DataCase

  alias StreamingApp.Streamers

  describe "streamers" do
    alias StreamingApp.Streamers.Streamer

    import StreamingApp.StreamersFixtures

    @invalid_attrs %{nombre: nil, url: nil}

    test "list_streamers/0 returns all streamers" do
      streamer = streamer_fixture()
      assert Streamers.list_streamers() == [streamer]
    end

    test "get_streamer!/1 returns the streamer with given id" do
      streamer = streamer_fixture()
      assert Streamers.get_streamer!(streamer.id) == streamer
    end

    test "create_streamer/1 with valid data creates a streamer" do
      valid_attrs = %{nombre: "some nombre", url: "some url"}

      assert {:ok, %Streamer{} = streamer} = Streamers.create_streamer(valid_attrs)
      assert streamer.nombre == "some nombre"
      assert streamer.url == "some url"
    end

    test "create_streamer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Streamers.create_streamer(@invalid_attrs)
    end

    test "update_streamer/2 with valid data updates the streamer" do
      streamer = streamer_fixture()
      update_attrs = %{nombre: "some updated nombre", url: "some updated url"}

      assert {:ok, %Streamer{} = streamer} = Streamers.update_streamer(streamer, update_attrs)
      assert streamer.nombre == "some updated nombre"
      assert streamer.url == "some updated url"
    end

    test "update_streamer/2 with invalid data returns error changeset" do
      streamer = streamer_fixture()
      assert {:error, %Ecto.Changeset{}} = Streamers.update_streamer(streamer, @invalid_attrs)
      assert streamer == Streamers.get_streamer!(streamer.id)
    end

    test "delete_streamer/1 deletes the streamer" do
      streamer = streamer_fixture()
      assert {:ok, %Streamer{}} = Streamers.delete_streamer(streamer)
      assert_raise Ecto.NoResultsError, fn -> Streamers.get_streamer!(streamer.id) end
    end

    test "change_streamer/1 returns a streamer changeset" do
      streamer = streamer_fixture()
      assert %Ecto.Changeset{} = Streamers.change_streamer(streamer)
    end
  end
end
