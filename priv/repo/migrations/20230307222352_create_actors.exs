defmodule StreamingApp.Repo.Migrations.CreateActors do
  use Ecto.Migration

  def change do
    create table(:actors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :apellido, :string
      add :nacionalidad, :string
      add :fecha_nac, :date
      add :edad, :integer
      add :movie_id, references(:movies, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:actors, [:movie_id,:nombre])

  end
end
