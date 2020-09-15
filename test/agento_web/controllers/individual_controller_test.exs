defmodule AgentoWeb.IndividualControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.IndividualContext

  @create_attrs %{birthdate: ~D[2010-04-17], dateofdeath: ~D[2010-04-17], displayname: "some displayname", firstname: "some firstname", gender: "some gender", is_deleted: true, lastname: "some lastname", native_language_code: "some native_language_code"}
  @update_attrs %{birthdate: ~D[2011-05-18], dateofdeath: ~D[2011-05-18], displayname: "some updated displayname", firstname: "some updated firstname", gender: "some updated gender", is_deleted: false, lastname: "some updated lastname", native_language_code: "some updated native_language_code"}
  @invalid_attrs %{birthdate: nil, dateofdeath: nil, displayname: nil, firstname: nil, gender: nil, is_deleted: nil, lastname: nil, native_language_code: nil}

  def fixture(:individual) do
    {:ok, individual} = IndividualContext.create_individual(@create_attrs)
    individual
  end

  describe "index" do
    test "lists all individuals", %{conn: conn} do
      conn = get(conn, Routes.individual_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Individuals"
    end
  end

  describe "new individual" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.individual_path(conn, :new))
      assert html_response(conn, 200) =~ "New Individual"
    end
  end

  describe "create individual" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.individual_path(conn, :create), individual: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.individual_path(conn, :show, id)

      conn = get(conn, Routes.individual_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Individual"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.individual_path(conn, :create), individual: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Individual"
    end
  end

  describe "edit individual" do
    setup [:create_individual]

    test "renders form for editing chosen individual", %{conn: conn, individual: individual} do
      conn = get(conn, Routes.individual_path(conn, :edit, individual))
      assert html_response(conn, 200) =~ "Edit Individual"
    end
  end

  describe "update individual" do
    setup [:create_individual]

    test "redirects when data is valid", %{conn: conn, individual: individual} do
      conn = put(conn, Routes.individual_path(conn, :update, individual), individual: @update_attrs)
      assert redirected_to(conn) == Routes.individual_path(conn, :show, individual)

      conn = get(conn, Routes.individual_path(conn, :show, individual))
      assert html_response(conn, 200) =~ "some updated displayname"
    end

    test "renders errors when data is invalid", %{conn: conn, individual: individual} do
      conn = put(conn, Routes.individual_path(conn, :update, individual), individual: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Individual"
    end
  end

  describe "delete individual" do
    setup [:create_individual]

    test "deletes chosen individual", %{conn: conn, individual: individual} do
      conn = delete(conn, Routes.individual_path(conn, :delete, individual))
      assert redirected_to(conn) == Routes.individual_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.individual_path(conn, :show, individual))
      end
    end
  end

  defp create_individual(_) do
    individual = fixture(:individual)
    %{individual: individual}
  end
end
