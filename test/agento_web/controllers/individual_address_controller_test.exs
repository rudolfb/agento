defmodule AgentoWeb.IndividualAddressControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.IndividualAddressContext

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:individual_address) do
    {:ok, individual_address} = IndividualAddressContext.create_individual_address(@create_attrs)
    individual_address
  end

  describe "index" do
    test "lists all individuals_addresses", %{conn: conn} do
      conn = get(conn, Routes.individual_address_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Individuals addresses"
    end
  end

  describe "new individual_address" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.individual_address_path(conn, :new))
      assert html_response(conn, 200) =~ "New Individual address"
    end
  end

  describe "create individual_address" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.individual_address_path(conn, :create), individual_address: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.individual_address_path(conn, :show, id)

      conn = get(conn, Routes.individual_address_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Individual address"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.individual_address_path(conn, :create), individual_address: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Individual address"
    end
  end

  describe "edit individual_address" do
    setup [:create_individual_address]

    test "renders form for editing chosen individual_address", %{conn: conn, individual_address: individual_address} do
      conn = get(conn, Routes.individual_address_path(conn, :edit, individual_address))
      assert html_response(conn, 200) =~ "Edit Individual address"
    end
  end

  describe "update individual_address" do
    setup [:create_individual_address]

    test "redirects when data is valid", %{conn: conn, individual_address: individual_address} do
      conn = put(conn, Routes.individual_address_path(conn, :update, individual_address), individual_address: @update_attrs)
      assert redirected_to(conn) == Routes.individual_address_path(conn, :show, individual_address)

      conn = get(conn, Routes.individual_address_path(conn, :show, individual_address))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, individual_address: individual_address} do
      conn = put(conn, Routes.individual_address_path(conn, :update, individual_address), individual_address: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Individual address"
    end
  end

  describe "delete individual_address" do
    setup [:create_individual_address]

    test "deletes chosen individual_address", %{conn: conn, individual_address: individual_address} do
      conn = delete(conn, Routes.individual_address_path(conn, :delete, individual_address))
      assert redirected_to(conn) == Routes.individual_address_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.individual_address_path(conn, :show, individual_address))
      end
    end
  end

  defp create_individual_address(_) do
    individual_address = fixture(:individual_address)
    %{individual_address: individual_address}
  end
end
