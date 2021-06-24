defmodule TrainexWeb.Resolvers.Trainings do
  alias Trainex.Trainings.Create

  def create(%{params: params}, _ctx), do: Create.call(params)
end
