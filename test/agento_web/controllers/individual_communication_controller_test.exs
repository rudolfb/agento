defmodule AgentoWeb.IndividualCommunicationControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.IndividualContext

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:individual_communication) do
    {:ok, individual_communication} = IndividualContext.create_individual_communication(@create_attrs)
    individual_communication
  end

  describe "index" do
    test "lists all individuals_communications", %{conn: conn} do
      conn = get(conn, Routes.individual_communication_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Individuals communications"
    end
  end

  describe "new individual_communication" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.individual_communication_path(conn, :new))
      assert html_response(conn, 200) =~ "New Individual communication"
    end
  end

  describe "create individual_communication" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.individual_communication_path(conn, :create), individual_communication: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.individual_communication_path(conn, :show, id)

      conn = get(conn, Routes.individual_communication_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Individual communication"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.individual_communication_path(conn, :create), individual_communication: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Individual communication"
    end
  end

  describe "edit individual_communication" do
    setup [:create_individual_communication]

    test "renders form for editing chosen individual_communication", %{conn: conn, individual_communication: individual_communication} do
      conn = get(conn, Routes.individual_communication_path(conn, :edit, individual_communication))
      assert html_response(conn, 200) =~ "Edit Individual communication"
    end
  end

  describe "update individual_communication" do
    setup [:create_individual_communication]

    test "redirects when data is valid", %{conn: conn, individual_communication: individual_communication} do
      conn = put(conn, Routes.individual_communication_path(conn, :update, individual_communication), individual_communication: @update_attrs)
      assert redirected_to(conn) == Routes.individual_communication_path(conn, :show, individual_communication)

      conn = get(conn, Routes.individual_communication_path(conn, :show, individual_communication))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, individual_communication: individual_communication} do
      conn = put(conn, Routes.individual_communication_path(conn, :update, individual_communication), individual_communication: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Individual communication"
    end
  end

  describe "delete individual_communication" do
    setup [:create_individual_communication]

    test "deletes chosen individual_communication", %{conn: conn, individual_communication: individual_communication} do
      conn = delete(conn, Routes.individual_communication_path(conn, :delete, individual_communication))
      assert redirected_to(conn) == Routes.individual_communication_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.individual_communication_path(conn, :show, individual_communication))
      end
    end
  end

  defp create_individual_communication(_) do
    individual_communication = fixture(:individual_communication)
    %{individual_communication: individual_communication}
  end
end
