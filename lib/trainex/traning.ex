defmodule Trainex.Training do
  use Ecto.Schema

  import Ecto.Changeset

  alias Trainex.{Exercise, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:user_id, :start_date, :end_date]

  schema "trainings" do
    belongs_to :user, User

    has_many :exercises, Exercise

    field :start_date, :date
    field :end_date, :date

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> cast_assoc(:exercises)
  end
end
