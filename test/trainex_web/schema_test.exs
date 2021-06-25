defmodule TrainexWeb.SchemaTest do
  use TrainexWeb.ConnCase, async: true

  alias Trainex.User
  alias Trainex.Users.Create, as: CreateUser

  describe "get_user/2" do
    test "with a valid id, returns the user", %{conn: conn} do
      params = %{email: "test@fakemail.com", name: "Testable", password: "very_secret_password"}

      {:ok, %User{id: user_id}} = CreateUser.call(params)

      query = """
        query{
          getUser(id: "#{user_id}") {
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "getUser" => %{
                   "email" => "test@fakemail.com",
                   "id" => _id,
                   "name" => "Testable"
                 }
               }
             } = response
    end
  end

  describe "create_user/2" do
    test "with valid params, creates an user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(params: { email: "test@fakemail.com", name: "Testable", password: "very_secret_password" }) {
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "email" => "test@fakemail.com",
                   "id" => _id,
                   "name" => "Testable"
                 }
               }
             } = response
    end
  end
end
