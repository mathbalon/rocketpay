defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.{Account}

  def render("update.json", %{
        account: %Account {
          id: id,
          balance: balance
        }
    }) do
    %{
      message: "Balance changed succefully",
      account: %{
        id: id,
        balance: balance
      }
    }
  end
end
