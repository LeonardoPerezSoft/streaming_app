defmodule StreamingApp.Repo.Migrations.CreateMoviesActors do
  use Ecto.Migration

  def change do
    create table(:movies_actors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :movie_id, references(:movies, on_delete: :nothing, type: :binary_id)
      add :actor_id, references(:actors, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:movies_actors, [:movie_id])
    create index(:movies_actors, [:actor_id])
    create unique_index(:movies_actors, [:movie_id, :actor_id])
  end
end
