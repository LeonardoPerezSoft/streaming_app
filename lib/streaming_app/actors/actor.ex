defmodule StreamingApp.Actors.Actor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "actors" do

    field :edad, :integer
    field :fecha_nac, :date
    field :nacionalidad, :string
    field :nombre, :string
    field :apellido, :string
    many_to_many :movies, StreamingApp.Movies.Movie, join_through: "movies_actors"

    timestamps()
  end

  @doc false
  def changeset(actor, attrs) do
    actor
    |> cast(attrs, [:nombre, :apellido, :nacionalidad, :fecha_nac, :edad])
    |> validate_required([:nombre, :apellido, :nacionalidad, :fecha_nac, :edad])
  end
end
