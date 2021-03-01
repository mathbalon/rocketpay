defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Allana",
        password: "cleopatra",
        nickname: "ovelha",
        email: "allana@gmail.com",
        age: 26
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{
        id: ^user_id,
        name: "Allana",
        nickname: "ovelha",
        email: "allana@gmail.com",
        age: 26
      } = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Allana",
        nickname: "ovelha",
        email: "allana@gmail.com",
        age: 26
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
