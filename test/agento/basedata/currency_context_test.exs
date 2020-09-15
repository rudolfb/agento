defmodule Agento.Basedata.CurrencyContextTest do
  use Agento.DataCase

  alias Agento.Basedata.CurrencyContext

  describe "currencies" do
    alias Agento.Basedata.CurrencyContext.Currency

    @valid_attrs %{code: "some code", is_complimentary: true, is_fund: true, is_metal: true, name: "some name"}
    @update_attrs %{code: "some updated code", is_complimentary: false, is_fund: false, is_metal: false, name: "some updated name"}
    @invalid_attrs %{code: nil, is_complimentary: nil, is_fund: nil, is_metal: nil, name: nil}

    def currency_fixture(attrs \\ %{}) do
      {:ok, currency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CurrencyContext.create_currency()

      currency
    end

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert CurrencyContext.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert CurrencyContext.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      assert {:ok, %Currency{} = currency} = CurrencyContext.create_currency(@valid_attrs)
      assert currency.code == "some code"
      assert currency.is_complimentary == true
      assert currency.is_fund == true
      assert currency.is_metal == true
      assert currency.name == "some name"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CurrencyContext.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{} = currency} = CurrencyContext.update_currency(currency, @update_attrs)
      assert currency.code == "some updated code"
      assert currency.is_complimentary == false
      assert currency.is_fund == false
      assert currency.is_metal == false
      assert currency.name == "some updated name"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = CurrencyContext.update_currency(currency, @invalid_attrs)
      assert currency == CurrencyContext.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = CurrencyContext.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> CurrencyContext.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = CurrencyContext.change_currency(currency)
    end
  end
end
