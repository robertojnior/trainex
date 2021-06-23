defmodule Trainex.Users.FindOne do
  alias Ecto.UUID
  alias Trainex.{Repo, User}

  def call(id) do
    case UUID.cast(id) do
      {:ok, id} -> get(id)
      :error -> {:error, :invalid_uuid}
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end
end
