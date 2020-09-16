defmodule AgentoWeb.AddressControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.AddressContext

  @create_attrs %{active: true, begindate: ~N[2010-04-17 14:00:00], city: "some city", enddate: ~N[2010-04-17 14:00:00], is_pobox: true, pobox: "some pobox", state: "some state", street1: "some street1", street2: "some street2", zipcode: "some zipcode"}
  @update_attrs %{active: false, begindate: ~N[2011-05-18 15:01:01], city: "some updated city", enddate: ~N[2011-05-18 15:01:01], is_pobox: false, pobox: "some updated pobox", state: "some updated state", street1: "some updated street1", street2: "some updated street2", zipcode: "some updated zipcode"}
  @invalid_attrs %{active: nil, begindate: nil, city: nil, enddate: nil, is_pobox: nil, pobox: nil, state: nil, street1: nil, street2: nil, zipcode: nil}

  def fixture(:address) do
    {:ok, address} = AddressContext.create_address(@create_attrs)
    address
  end

  describe "index" do
    test "lists all addresses", %{conn: conn} do
      conn = get(conn, Routes.address_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Addresses"
    end
  end

  describe "new address" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.address_path(conn, :new))
      assert html_response(conn, 200) =~ "New Address"
    end
  end

  describe "create address" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.address_path(conn, :create), address: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.address_path(conn, :show, id)

      conn = get(conn, Routes.address_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Address"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.address_path(conn, :create), address: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Address"
    end
  end

  describe "edit address" do
    setup [:create_address]

    test "renders form for editing chosen address", %{conn: conn, address: address} do
      conn = get(conn, Routes.address_path(conn, :edit, address))
      assert html_response(conn, 200) =~ "Edit Address"
    end
  end

  describe "update address" do
    setup [:create_address]

    test "redirects when data is valid", %{conn: conn, address: address} do
      conn = put(conn, Routes.address_path(conn, :update, address), address: @update_attrs)
      assert redirected_to(conn) == Routes.address_path(conn, :show, address)

      conn = get(conn, Routes.address_path(conn, :show, address))
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, address: address} do
      conn = put(conn, Routes.address_path(conn, :update, address), address: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Address"
    end
  end

  describe "delete address" do
    setup [:create_address]

    test "deletes chosen address", %{conn: conn, address: address} do
      conn = delete(conn, Routes.address_path(conn, :delete, address))
      assert redirected_to(conn) == Routes.address_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.address_path(conn, :show, address))
      end
    end
  end

  defp create_address(_) do
    address = fixture(:address)
    %{address: address}
  end
end
