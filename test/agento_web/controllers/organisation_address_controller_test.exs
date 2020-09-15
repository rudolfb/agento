defmodule AgentoWeb.OrganisationAddressControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.OrganisationAddressContext

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:organisation_address) do
    {:ok, organisation_address} = OrganisationAddressContext.create_organisation_address(@create_attrs)
    organisation_address
  end

  describe "index" do
    test "lists all organisations_addresses", %{conn: conn} do
      conn = get(conn, Routes.organisation_address_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Organisations addresses"
    end
  end

  describe "new organisation_address" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.organisation_address_path(conn, :new))
      assert html_response(conn, 200) =~ "New Organisation address"
    end
  end

  describe "create organisation_address" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.organisation_address_path(conn, :create), organisation_address: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.organisation_address_path(conn, :show, id)

      conn = get(conn, Routes.organisation_address_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Organisation address"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.organisation_address_path(conn, :create), organisation_address: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Organisation address"
    end
  end

  describe "edit organisation_address" do
    setup [:create_organisation_address]

    test "renders form for editing chosen organisation_address", %{conn: conn, organisation_address: organisation_address} do
      conn = get(conn, Routes.organisation_address_path(conn, :edit, organisation_address))
      assert html_response(conn, 200) =~ "Edit Organisation address"
    end
  end

  describe "update organisation_address" do
    setup [:create_organisation_address]

    test "redirects when data is valid", %{conn: conn, organisation_address: organisation_address} do
      conn = put(conn, Routes.organisation_address_path(conn, :update, organisation_address), organisation_address: @update_attrs)
      assert redirected_to(conn) == Routes.organisation_address_path(conn, :show, organisation_address)

      conn = get(conn, Routes.organisation_address_path(conn, :show, organisation_address))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, organisation_address: organisation_address} do
      conn = put(conn, Routes.organisation_address_path(conn, :update, organisation_address), organisation_address: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Organisation address"
    end
  end

  describe "delete organisation_address" do
    setup [:create_organisation_address]

    test "deletes chosen organisation_address", %{conn: conn, organisation_address: organisation_address} do
      conn = delete(conn, Routes.organisation_address_path(conn, :delete, organisation_address))
      assert redirected_to(conn) == Routes.organisation_address_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.organisation_address_path(conn, :show, organisation_address))
      end
    end
  end

  defp create_organisation_address(_) do
    organisation_address = fixture(:organisation_address)
    %{organisation_address: organisation_address}
  end
end
