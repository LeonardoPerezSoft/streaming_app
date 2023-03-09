defmodule StreamingApp.Movies_Actors.Movie_Actor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "movies_actors" do

    belongs_to :movie, StreamingApp.Movies.Movie
    belongs_to :actor, StreamingApp.Streamers.Streamer


    timestamps()
  end

  @doc false
  def changeset(movie__actor, attrs) do
    movie__actor
    |> cast(attrs, [:movie_id, :actor_id])
    |> validate_required([])
  end
end
