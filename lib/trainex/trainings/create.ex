defmodule Trainex.Trainings.Create do
  alias Trainex.{Repo, Training}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
