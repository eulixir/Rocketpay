defmodule Rocketpay.Users.Create do
  alias Rocketpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

  defp insert({:ok, struct}), do: Repo.insert(struct)
  defp insert({:error, _changeset} = error), do: error
end
