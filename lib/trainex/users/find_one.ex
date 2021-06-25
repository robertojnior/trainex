defmodule Trainex.Users.FindOne do
  import Ecto.Query

  alias Ecto.UUID
  alias Trainex.{Repo, Training, User}

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
        {:ok, preload_training(user)}
    end
  end

  defp preload_training(user) do
    today = Date.utc_today()

    query =
      from trainings in Training,
        where: ^today >= trainings.start_date and ^today <= trainings.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
