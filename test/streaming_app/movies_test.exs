defmodule StreamingApp.MoviesTest do
  use StreamingApp.DataCase

  alias StreamingApp.Movies

  describe "movies" do
    alias StreamingApp.Movies.Movie

    import StreamingApp.MoviesFixtures

    @invalid_attrs %{año: nil, director: nil, genero: nil, nombre: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Movies.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Movies.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{año: 42, director: "some director", genero: "some genero", nombre: "some nombre"}

      assert {:ok, %Movie{} = movie} = Movies.create_movie(valid_attrs)
      assert movie.año == 42
      assert movie.director == "some director"
      assert movie.genero == "some genero"
      assert movie.nombre == "some nombre"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{año: 43, director: "some updated director", genero: "some updated genero", nombre: "some updated nombre"}

      assert {:ok, %Movie{} = movie} = Movies.update_movie(movie, update_attrs)
      assert movie.año == 43
      assert movie.director == "some updated director"
      assert movie.genero == "some updated genero"
      assert movie.nombre == "some updated nombre"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies.update_movie(movie, @invalid_attrs)
      assert movie == Movies.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Movies.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Movies.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Movies.change_movie(movie)
    end
  end
end
