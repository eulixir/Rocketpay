defmodule Rocketpay.Accounts.Transaction do
  alias Ecto.Multi

  def call(%{"frin" => from_id, "to" => to_id, "value" => value}) do
      Multi.new()
      |> Multi.merge(fn -> _changes -> Operation.call(withfraw_params, :widthdraw) end)
      |> Multi.merge(fn -> _changes -> Operation.call(deposit_params, :deposit) end)
  end
end
