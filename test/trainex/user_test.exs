defmodule Trainex.UserTest do
  use Trainex.DataCase, async: true

  alias Trainex.User

  describe "changeset/1" do
    test "with valid params, returns a valid changeset" do
      params = %{email: "test@fakemail.com", name: "Testable", password: "very_secret_password"}

      assert %Ecto.Changeset{changes: ^params, errors: [], valid?: true} = User.changeset(params)
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{email: "", name: "T", password: "very_secret_password"}

      changeset = User.changeset(params)

      expected_errors = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      assert %Ecto.Changeset{valid?: false} = changeset
      assert errors_on(changeset) == expected_errors
    end
  end
end
