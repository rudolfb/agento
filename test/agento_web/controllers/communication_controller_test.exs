defmodule AgentoWeb.CommunicationControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.CommunicationContext

  @create_attrs %{typecode: "some typecode", value: "some value"}
  @update_attrs %{typecode: "some updated typecode", value: "some updated value"}
  @invalid_attrs %{typecode: nil, value: nil}

  def fixture(:communication) do
    {:ok, communication} = CommunicationContext.create_communication(@create_attrs)
    communication
  end

  describe "index" do
    test "lists all communications", %{conn: conn} do
      conn = get(conn, Routes.communication_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Communications"
    end
  end

  describe "new communication" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.communication_path(conn, :new))
      assert html_response(conn, 200) =~ "New Communication"
    end
  end

  describe "create communication" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.communication_path(conn, :create), communication: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.communication_path(conn, :show, id)

      conn = get(conn, Routes.communication_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Communication"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.communication_path(conn, :create), communication: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Communication"
    end
  end

  describe "edit communication" do
    setup [:create_communication]

    test "renders form for editing chosen communication", %{conn: conn, communication: communication} do
      conn = get(conn, Routes.communication_path(conn, :edit, communication))
      assert html_response(conn, 200) =~ "Edit Communication"
    end
  end

  describe "update communication" do
    setup [:create_communication]

    test "redirects when data is valid", %{conn: conn, communication: communication} do
      conn = put(conn, Routes.communication_path(conn, :update, communication), communication: @update_attrs)
      assert redirected_to(conn) == Routes.communication_path(conn, :show, communication)

      conn = get(conn, Routes.communication_path(conn, :show, communication))
      assert html_response(conn, 200) =~ "some updated typecode"
    end

    test "renders errors when data is invalid", %{conn: conn, communication: communication} do
      conn = put(conn, Routes.communication_path(conn, :update, communication), communication: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Communication"
    end
  end

  describe "delete communication" do
    setup [:create_communication]

    test "deletes chosen communication", %{conn: conn, communication: communication} do
      conn = delete(conn, Routes.communication_path(conn, :delete, communication))
      assert redirected_to(conn) == Routes.communication_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.communication_path(conn, :show, communication))
      end
    end
  end

  defp create_communication(_) do
    communication = fixture(:communication)
    %{communication: communication}
  end
end
