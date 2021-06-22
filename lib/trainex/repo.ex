defmodule Trainex.Repo do
  use Ecto.Repo,
    otp_app: :trainex,
    adapter: Ecto.Adapters.Postgres
end
