defmodule TrainexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types TrainexWeb.Schema.Types.Exercise

  @desc "Training schema representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  input_object :training_params do
    field :user_id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise_params)
  end
end
