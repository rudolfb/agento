defmodule AgentoWeb.AddressTypeControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.AddressTypeContext

  @create_attrs %{code: "some code"}
  @update_attrs %{code: "some updated code"}
  @invalid_attrs %{code: nil}

  def fixture(:address_type) do
    {:ok, address_type} = AddressTypeContext.create_address_type(@create_attrs)
    address_type
  end

  describe "index" do
    test "lists all addresstypes", %{conn: conn} do
      conn = get(conn, Routes.address_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Addresstypes"
    end
  end

  describe "new address_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.address_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Address type"
    end
  end

  describe "create address_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.address_type_path(conn, :create), address_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.address_type_path(conn, :show, id)

      conn = get(conn, Routes.address_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Address type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.address_type_path(conn, :create), address_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Address type"
    end
  end

  describe "edit address_type" do
    setup [:create_address_type]

    test "renders form for editing chosen address_type", %{conn: conn, address_type: address_type} do
      conn = get(conn, Routes.address_type_path(conn, :edit, address_type))
      assert html_response(conn, 200) =~ "Edit Address type"
    end
  end

  describe "update address_type" do
    setup [:create_address_type]

    test "redirects when data is valid", %{conn: conn, address_type: address_type} do
      conn = put(conn, Routes.address_type_path(conn, :update, address_type), address_type: @update_attrs)
      assert redirected_to(conn) == Routes.address_type_path(conn, :show, address_type)

      conn = get(conn, Routes.address_type_path(conn, :show, address_type))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, address_type: address_type} do
      conn = put(conn, Routes.address_type_path(conn, :update, address_type), address_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Address type"
    end
  end

  describe "delete address_type" do
    setup [:create_address_type]

    test "deletes chosen address_type", %{conn: conn, address_type: address_type} do
      conn = delete(conn, Routes.address_type_path(conn, :delete, address_type))
      assert redirected_to(conn) == Routes.address_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.address_type_path(conn, :show, address_type))
      end
    end
  end

  defp create_address_type(_) do
    address_type = fixture(:address_type)
    %{address_type: address_type}
  end
end
