defmodule Trainex.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :training_id, references(:trainings)

      add :name, :string
      add :training_method, :string
      add :repetitions, :string
      add :video_tutorial_url, :string

      timestamps()
    end
  end
end
