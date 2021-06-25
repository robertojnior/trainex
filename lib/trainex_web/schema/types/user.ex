defmodule TrainexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "User schema representation"
  object :user do
    field :id, non_null(:uuid4)
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :trainings, list_of(:training)
  end

  input_object :user_params do
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :password, non_null(:string)
  end
end
