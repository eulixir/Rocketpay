defmodule Rocketpay.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :email, :password_hash, :nickname]
  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password_hash, :string
    field :nickname, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end

# config :rocketpay, Rocketpay.Repo,
#   migration_primary_key: [type: :binary_id],
#   migration_foreign_key: [type: :binary_id]
