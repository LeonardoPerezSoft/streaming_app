defmodule StreamingApp.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :año, :integer
      add :director, :string
      add :genero, :string
      add :streamer_id, references(:streamers, on_delete: :delete_all, type: :binary_id)
      #add :director_id, references(:directors, on_delete: :delete_all, type: :binary_id)
      add :actor_id, references(:actors, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:movies, [:streamer_id, :nombre])
    #create index(:movies, [:director_id, :nombre])
    create index(:movies, [:actor_id, :nombre])

  end
end
