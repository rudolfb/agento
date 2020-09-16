defmodule AgentoWeb.OrganisationNameTransControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.OrganisationNameTransContext

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:organisation_name_trans) do
    {:ok, organisation_name_trans} = OrganisationNameTransContext.create_organisation_name_trans(@create_attrs)
    organisation_name_trans
  end

  describe "index" do
    test "lists all organisation_name_trans", %{conn: conn} do
      conn = get(conn, Routes.organisation_name_trans_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Organisation name trans"
    end
  end

  describe "new organisation_name_trans" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.organisation_name_trans_path(conn, :new))
      assert html_response(conn, 200) =~ "New Organisation name trans"
    end
  end

  describe "create organisation_name_trans" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.organisation_name_trans_path(conn, :create), organisation_name_trans: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.organisation_name_trans_path(conn, :show, id)

      conn = get(conn, Routes.organisation_name_trans_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Organisation name trans"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.organisation_name_trans_path(conn, :create), organisation_name_trans: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Organisation name trans"
    end
  end

  describe "edit organisation_name_trans" do
    setup [:create_organisation_name_trans]

    test "renders form for editing chosen organisation_name_trans", %{conn: conn, organisation_name_trans: organisation_name_trans} do
      conn = get(conn, Routes.organisation_name_trans_path(conn, :edit, organisation_name_trans))
      assert html_response(conn, 200) =~ "Edit Organisation name trans"
    end
  end

  describe "update organisation_name_trans" do
    setup [:create_organisation_name_trans]

    test "redirects when data is valid", %{conn: conn, organisation_name_trans: organisation_name_trans} do
      conn = put(conn, Routes.organisation_name_trans_path(conn, :update, organisation_name_trans), organisation_name_trans: @update_attrs)
      assert redirected_to(conn) == Routes.organisation_name_trans_path(conn, :show, organisation_name_trans)

      conn = get(conn, Routes.organisation_name_trans_path(conn, :show, organisation_name_trans))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, organisation_name_trans: organisation_name_trans} do
      conn = put(conn, Routes.organisation_name_trans_path(conn, :update, organisation_name_trans), organisation_name_trans: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Organisation name trans"
    end
  end

  describe "delete organisation_name_trans" do
    setup [:create_organisation_name_trans]

    test "deletes chosen organisation_name_trans", %{conn: conn, organisation_name_trans: organisation_name_trans} do
      conn = delete(conn, Routes.organisation_name_trans_path(conn, :delete, organisation_name_trans))
      assert redirected_to(conn) == Routes.organisation_name_trans_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.organisation_name_trans_path(conn, :show, organisation_name_trans))
      end
    end
  end

  defp create_organisation_name_trans(_) do
    organisation_name_trans = fixture(:organisation_name_trans)
    %{organisation_name_trans: organisation_name_trans}
  end
end
