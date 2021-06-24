defmodule TrainexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Exercise schema representation"
  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :training_method, non_null(:string)
    field :repetitions, non_null(:string)
    field :video_tutorial_url, non_null(:string)
  end

  input_object :exercise_params do
    field :name, non_null(:string)
    field :training_method, non_null(:string)
    field :repetitions, non_null(:string)
    field :video_tutorial_url, :string
  end
end
