defmodule StreamingApp.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "movies" do
    field :año, :integer
    field :director, :string
    field :genero, :string
    field :nombre, :string
    belongs_to :streamer, StreamingApp.Streamers.Streamer
    many_to_many :actors, StreamingApp.Actors.Actor, join_through: "movies_actors"
    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:nombre, :año, :director, :genero, :streamer_id])
    |> validate_required([:nombre, :año, :director, :genero])
    #|> validate_length(:nombre, min: 4, message: "Ingresa un nombre valido")
    |> unique_constraint(:nombre, message: " Este Streamer ya fue creado en la BD")

  end
end
