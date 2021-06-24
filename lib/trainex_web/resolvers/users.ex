defmodule TrainexWeb.Resolvers.Users do
  alias Trainex.Users.{Create, FindOne}

  def find_one(%{id: id}, _ctx), do: FindOne.call(id)
  def create(%{params: params}, _ctx), do: Create.call(params)
end
