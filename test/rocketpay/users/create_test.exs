defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Jp",
        password: "123456",
        nickname: "João Pedro",
        email: "joao@rocket.com",
        age: 19
      }
      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Jp", age: 19, id: ^user_id} = user
    end

    test "when all params are invalid, returns an user" do
      params = %{
        name: "Jp",
        nickname: "João Pedro",
        email: "joao@rocket.com",
        age: 17
      }
      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
