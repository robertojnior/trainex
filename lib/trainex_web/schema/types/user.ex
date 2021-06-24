defmodule TrainexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import_types TrainexWeb.Schema.Types.Custom.UUID4

  @desc "User schema representation"
  object :user do
    field :id, non_null(:uuid4)
    field :email, non_null(:string)
    field :name, non_null(:string)
  end

  input_object :user_params do
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :password, non_null(:string)
  end
end
