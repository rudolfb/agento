defmodule AgentoWeb.CurrencyControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.CurrencyContext

  @create_attrs %{code: "some code", is_complimentary: true, is_fund: true, is_metal: true, name: "some name"}
  @update_attrs %{code: "some updated code", is_complimentary: false, is_fund: false, is_metal: false, name: "some updated name"}
  @invalid_attrs %{code: nil, is_complimentary: nil, is_fund: nil, is_metal: nil, name: nil}

  def fixture(:currency) do
    {:ok, currency} = CurrencyContext.create_currency(@create_attrs)
    currency
  end

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get(conn, Routes.currency_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Currencies"
    end
  end

  describe "new currency" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.currency_path(conn, :new))
      assert html_response(conn, 200) =~ "New Currency"
    end
  end

  describe "create currency" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.currency_path(conn, :create), currency: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.currency_path(conn, :show, id)

      conn = get(conn, Routes.currency_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Currency"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.currency_path(conn, :create), currency: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Currency"
    end
  end

  describe "edit currency" do
    setup [:create_currency]

    test "renders form for editing chosen currency", %{conn: conn, currency: currency} do
      conn = get(conn, Routes.currency_path(conn, :edit, currency))
      assert html_response(conn, 200) =~ "Edit Currency"
    end
  end

  describe "update currency" do
    setup [:create_currency]

    test "redirects when data is valid", %{conn: conn, currency: currency} do
      conn = put(conn, Routes.currency_path(conn, :update, currency), currency: @update_attrs)
      assert redirected_to(conn) == Routes.currency_path(conn, :show, currency)

      conn = get(conn, Routes.currency_path(conn, :show, currency))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, currency: currency} do
      conn = put(conn, Routes.currency_path(conn, :update, currency), currency: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Currency"
    end
  end

  describe "delete currency" do
    setup [:create_currency]

    test "deletes chosen currency", %{conn: conn, currency: currency} do
      conn = delete(conn, Routes.currency_path(conn, :delete, currency))
      assert redirected_to(conn) == Routes.currency_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.currency_path(conn, :show, currency))
      end
    end
  end

  defp create_currency(_) do
    currency = fixture(:currency)
    %{currency: currency}
  end
end
