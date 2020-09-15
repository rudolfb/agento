defmodule AgentoWeb.RoleTypeControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.RoleContext

  @create_attrs %{code: "some code"}
  @update_attrs %{code: "some updated code"}
  @invalid_attrs %{code: nil}

  def fixture(:role_type) do
    {:ok, role_type} = RoleContext.create_role_type(@create_attrs)
    role_type
  end

  describe "index" do
    test "lists all roletypes", %{conn: conn} do
      conn = get(conn, Routes.role_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Roletypes"
    end
  end

  describe "new role_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.role_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Role type"
    end
  end

  describe "create role_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.role_type_path(conn, :create), role_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.role_type_path(conn, :show, id)

      conn = get(conn, Routes.role_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Role type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.role_type_path(conn, :create), role_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Role type"
    end
  end

  describe "edit role_type" do
    setup [:create_role_type]

    test "renders form for editing chosen role_type", %{conn: conn, role_type: role_type} do
      conn = get(conn, Routes.role_type_path(conn, :edit, role_type))
      assert html_response(conn, 200) =~ "Edit Role type"
    end
  end

  describe "update role_type" do
    setup [:create_role_type]

    test "redirects when data is valid", %{conn: conn, role_type: role_type} do
      conn = put(conn, Routes.role_type_path(conn, :update, role_type), role_type: @update_attrs)
      assert redirected_to(conn) == Routes.role_type_path(conn, :show, role_type)

      conn = get(conn, Routes.role_type_path(conn, :show, role_type))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, role_type: role_type} do
      conn = put(conn, Routes.role_type_path(conn, :update, role_type), role_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Role type"
    end
  end

  describe "delete role_type" do
    setup [:create_role_type]

    test "deletes chosen role_type", %{conn: conn, role_type: role_type} do
      conn = delete(conn, Routes.role_type_path(conn, :delete, role_type))
      assert redirected_to(conn) == Routes.role_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.role_type_path(conn, :show, role_type))
      end
    end
  end

  defp create_role_type(_) do
    role_type = fixture(:role_type)
    %{role_type: role_type}
  end
end
