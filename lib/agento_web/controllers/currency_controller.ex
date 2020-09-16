defmodule AgentoWeb.CurrencyController do
  use AgentoWeb, :controller

  alias Agento.Basedata.CurrencyContext
  alias Agento.Basedata.CurrencyContext.Currency

  def index(conn, _params) do
    currencies = CurrencyContext.list_currencies()
    render(conn, "index.html", currencies: currencies)
  end

  def new(conn, _params) do
    changeset = CurrencyContext.change_currency(%Currency{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"currency" => currency_params}) do
    case CurrencyContext.create_currency(currency_params) do
      {:ok, currency} ->
        conn
        |> put_flash(:info, "Currency created successfully.")
        |> redirect(to: Routes.currency_path(conn, :show, currency))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    currency = CurrencyContext.get_currency!(id)
    render(conn, "show.html", currency: currency)
  end

  def edit(conn, %{"id" => id}) do
    currency = CurrencyContext.get_currency!(id)
    changeset = CurrencyContext.change_currency(currency)
    render(conn, "edit.html", currency: currency, changeset: changeset)
  end

  def update(conn, %{"id" => id, "currency" => currency_params}) do
    currency = CurrencyContext.get_currency!(id)

    case CurrencyContext.update_currency(currency, currency_params) do
      {:ok, currency} ->
        conn
        |> put_flash(:info, "Currency updated successfully.")
        |> redirect(to: Routes.currency_path(conn, :show, currency))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", currency: currency, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    currency = CurrencyContext.get_currency!(id)
    {:ok, _currency} = CurrencyContext.delete_currency(currency)

    conn
    |> put_flash(:info, "Currency deleted successfully.")
    |> redirect(to: Routes.currency_path(conn, :index))
  end
end
