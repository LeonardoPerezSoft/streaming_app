defmodule StreamingApp.Movies_ActorsTest do
  use StreamingApp.DataCase

  alias StreamingApp.Movies_Actors

  describe "movies_actors" do
    alias StreamingApp.Movies_Actors.Movie_Actor

    import StreamingApp.Movies_ActorsFixtures

    @invalid_attrs %{}

    test "list_movies_actors/0 returns all movies_actors" do
      movie__actor = movie__actor_fixture()
      assert Movies_Actors.list_movies_actors() == [movie__actor]
    end

    test "get_movie__actor!/1 returns the movie__actor with given id" do
      movie__actor = movie__actor_fixture()
      assert Movies_Actors.get_movie__actor!(movie__actor.id) == movie__actor
    end

    test "create_movie__actor/1 with valid data creates a movie__actor" do
      valid_attrs = %{}

      assert {:ok, %Movie_Actor{} = movie__actor} = Movies_Actors.create_movie__actor(valid_attrs)
    end

    test "create_movie__actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies_Actors.create_movie__actor(@invalid_attrs)
    end

    test "update_movie__actor/2 with valid data updates the movie__actor" do
      movie__actor = movie__actor_fixture()
      update_attrs = %{}

      assert {:ok, %Movie_Actor{} = movie__actor} = Movies_Actors.update_movie__actor(movie__actor, update_attrs)
    end

    test "update_movie__actor/2 with invalid data returns error changeset" do
      movie__actor = movie__actor_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies_Actors.update_movie__actor(movie__actor, @invalid_attrs)
      assert movie__actor == Movies_Actors.get_movie__actor!(movie__actor.id)
    end

    test "delete_movie__actor/1 deletes the movie__actor" do
      movie__actor = movie__actor_fixture()
      assert {:ok, %Movie_Actor{}} = Movies_Actors.delete_movie__actor(movie__actor)
      assert_raise Ecto.NoResultsError, fn -> Movies_Actors.get_movie__actor!(movie__actor.id) end
    end

    test "change_movie__actor/1 returns a movie__actor changeset" do
      movie__actor = movie__actor_fixture()
      assert %Ecto.Changeset{} = Movies_Actors.change_movie__actor(movie__actor)
    end
  end
end
