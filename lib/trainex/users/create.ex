defmodule Trainex.Users.Create do
  alias Trainex.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
