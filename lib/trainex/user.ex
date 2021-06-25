defmodule Trainex.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Trainex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :name, :password]

  @email_regex ~r/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  schema "users" do
    has_many :trainings, Training

    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 8)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, @email_regex)
    |> unique_constraint([:email])
  end
end
