defmodule AgentoWeb.OrganisationCommunicationsControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.OrganisationCommunicationContext

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:organisation_communications) do
    {:ok, organisation_communications} = OrganisationCommunicationContext.create_organisation_communications(@create_attrs)
    organisation_communications
  end

  describe "index" do
    test "lists all organisations_communications", %{conn: conn} do
      conn = get(conn, Routes.organisation_communications_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Organisations communications"
    end
  end

  describe "new organisation_communications" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.organisation_communications_path(conn, :new))
      assert html_response(conn, 200) =~ "New Organisation communications"
    end
  end

  describe "create organisation_communications" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.organisation_communications_path(conn, :create), organisation_communications: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.organisation_communications_path(conn, :show, id)

      conn = get(conn, Routes.organisation_communications_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Organisation communications"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.organisation_communications_path(conn, :create), organisation_communications: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Organisation communications"
    end
  end

  describe "edit organisation_communications" do
    setup [:create_organisation_communications]

    test "renders form for editing chosen organisation_communications", %{conn: conn, organisation_communications: organisation_communications} do
      conn = get(conn, Routes.organisation_communications_path(conn, :edit, organisation_communications))
      assert html_response(conn, 200) =~ "Edit Organisation communications"
    end
  end

  describe "update organisation_communications" do
    setup [:create_organisation_communications]

    test "redirects when data is valid", %{conn: conn, organisation_communications: organisation_communications} do
      conn = put(conn, Routes.organisation_communications_path(conn, :update, organisation_communications), organisation_communications: @update_attrs)
      assert redirected_to(conn) == Routes.organisation_communications_path(conn, :show, organisation_communications)

      conn = get(conn, Routes.organisation_communications_path(conn, :show, organisation_communications))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, organisation_communications: organisation_communications} do
      conn = put(conn, Routes.organisation_communications_path(conn, :update, organisation_communications), organisation_communications: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Organisation communications"
    end
  end

  describe "delete organisation_communications" do
    setup [:create_organisation_communications]

    test "deletes chosen organisation_communications", %{conn: conn, organisation_communications: organisation_communications} do
      conn = delete(conn, Routes.organisation_communications_path(conn, :delete, organisation_communications))
      assert redirected_to(conn) == Routes.organisation_communications_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.organisation_communications_path(conn, :show, organisation_communications))
      end
    end
  end

  defp create_organisation_communications(_) do
    organisation_communications = fixture(:organisation_communications)
    %{organisation_communications: organisation_communications}
  end
end
