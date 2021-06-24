defmodule Trainex.Exercise do
  use Ecto.Schema

  import Ecto.Changeset

  alias Trainex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_fields [:name, :training_method, :repetitions]
  @fields @required_fields ++ [:video_tutorial_url]

  schema "exercises" do
    belongs_to :training, Training

    field :name, :string
    field :training_method, :string
    field :repetitions, :string
    field :video_tutorial_url, :string

    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
