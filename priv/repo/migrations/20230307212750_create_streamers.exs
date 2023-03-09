defmodule StreamingApp.Repo.Migrations.CreateStreamers do
  use Ecto.Migration

  def change do
    create table(:streamers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :url, :string

      timestamps()
    end

    create unique_index(:streamers, [:url])

  end
end
