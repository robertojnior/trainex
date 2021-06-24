defmodule TrainexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias TrainexWeb.Resolvers.Users, as: UsersResolver

  import_types TrainexWeb.Schema.Types.User

  object :queries do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UsersResolver.find_one/2
    end
  end

  object :mutations do
    field :create_user, type: :user do
      arg :params, non_null(:user_params)

      resolve &UsersResolver.create/2
    end
  end
end
