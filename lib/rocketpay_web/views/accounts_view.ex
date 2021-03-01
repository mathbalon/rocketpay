defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.{Account}
  alias Rocketpay.Accounts.Transaction.Response, as: TransactionResponse

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

  def render("transaction.json", %{
    transaction: %TransactionResponse{
      from_account: from_account,
      to_account: to_account
      }
    }) do
    %{
      message: "Succefully transaction",
      transaction: %{
        from: %{
          id: from_account.id,
          balance: from_account.balance,
        },
        to: %{
          id: to_account.id,
          balance: to_account.balance,
        }
      }
    }
  end
end
