defmodule TrainexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors

  alias TrainexWeb.Resolvers
  alias TrainexWeb.Schema.Types

  alias Resolvers.Trainings, as: TrainingsResolver
  alias Resolvers.Users, as: UsersResolver

  import_types Types.Custom.UUID4
  import_types Types.User
  import_types Types.Training

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
      middleware TranslateErrors
    end

    field :create_training, type: :training do
      arg :params, non_null(:training_params)

      resolve &TrainingsResolver.create/2
      middleware TranslateErrors
    end
  end
end
