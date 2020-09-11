defmodule AgentoWeb.CommunicationTypeCodeControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.CommunicationTypeCodesContext

  @create_attrs %{code: "some code"}
  @update_attrs %{code: "some updated code"}
  @invalid_attrs %{code: nil}

  def fixture(:communication_type_code) do
    {:ok, communication_type_code} = CommunicationTypeCodesContext.create_communication_type_code(@create_attrs)
    communication_type_code
  end

  describe "index" do
    test "lists all communication_type_codes", %{conn: conn} do
      conn = get(conn, Routes.communication_type_code_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Communication type codes"
    end
  end

  describe "new communication_type_code" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.communication_type_code_path(conn, :new))
      assert html_response(conn, 200) =~ "New Communication type code"
    end
  end

  describe "create communication_type_code" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.communication_type_code_path(conn, :create), communication_type_code: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.communication_type_code_path(conn, :show, id)

      conn = get(conn, Routes.communication_type_code_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Communication type code"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.communication_type_code_path(conn, :create), communication_type_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Communication type code"
    end
  end

  describe "edit communication_type_code" do
    setup [:create_communication_type_code]

    test "renders form for editing chosen communication_type_code", %{conn: conn, communication_type_code: communication_type_code} do
      conn = get(conn, Routes.communication_type_code_path(conn, :edit, communication_type_code))
      assert html_response(conn, 200) =~ "Edit Communication type code"
    end
  end

  describe "update communication_type_code" do
    setup [:create_communication_type_code]

    test "redirects when data is valid", %{conn: conn, communication_type_code: communication_type_code} do
      conn = put(conn, Routes.communication_type_code_path(conn, :update, communication_type_code), communication_type_code: @update_attrs)
      assert redirected_to(conn) == Routes.communication_type_code_path(conn, :show, communication_type_code)

      conn = get(conn, Routes.communication_type_code_path(conn, :show, communication_type_code))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, communication_type_code: communication_type_code} do
      conn = put(conn, Routes.communication_type_code_path(conn, :update, communication_type_code), communication_type_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Communication type code"
    end
  end

  describe "delete communication_type_code" do
    setup [:create_communication_type_code]

    test "deletes chosen communication_type_code", %{conn: conn, communication_type_code: communication_type_code} do
      conn = delete(conn, Routes.communication_type_code_path(conn, :delete, communication_type_code))
      assert redirected_to(conn) == Routes.communication_type_code_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.communication_type_code_path(conn, :show, communication_type_code))
      end
    end
  end

  defp create_communication_type_code(_) do
    communication_type_code = fixture(:communication_type_code)
    %{communication_type_code: communication_type_code}
  end
end
