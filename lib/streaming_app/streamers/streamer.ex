defmodule StreamingApp.Streamers.Streamer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "streamers" do
    field :nombre, :string
    field :url, :string
    has_many :movies, StreamingApp.Movies.Movie

    timestamps()
  end

  @doc false
  def changeset(streamer, attrs) do
    streamer
    |> cast(attrs, [:nombre, :url])
    |> validate_required([:nombre, :url])
    |> validate_length(:nombre, min: 5, message: "Ingresa un nombre valido")
    |> unique_constraint(:nombre, message: " Este Streamer ya fue creado en la BD")
  end
end
