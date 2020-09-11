defmodule AgentoWeb.IdentificationTypeCodeControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.IdentificationTypeCodeContext

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:identification_type_code) do
    {:ok, identification_type_code} = IdentificationTypeCodeContext.create_identification_type_code(@create_attrs)
    identification_type_code
  end

  describe "index" do
    test "lists all identificationtypecodes", %{conn: conn} do
      conn = get(conn, Routes.identification_type_code_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Identificationtypecodes"
    end
  end

  describe "new identification_type_code" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.identification_type_code_path(conn, :new))
      assert html_response(conn, 200) =~ "New Identification type code"
    end
  end

  describe "create identification_type_code" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.identification_type_code_path(conn, :create), identification_type_code: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.identification_type_code_path(conn, :show, id)

      conn = get(conn, Routes.identification_type_code_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Identification type code"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.identification_type_code_path(conn, :create), identification_type_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Identification type code"
    end
  end

  describe "edit identification_type_code" do
    setup [:create_identification_type_code]

    test "renders form for editing chosen identification_type_code", %{conn: conn, identification_type_code: identification_type_code} do
      conn = get(conn, Routes.identification_type_code_path(conn, :edit, identification_type_code))
      assert html_response(conn, 200) =~ "Edit Identification type code"
    end
  end

  describe "update identification_type_code" do
    setup [:create_identification_type_code]

    test "redirects when data is valid", %{conn: conn, identification_type_code: identification_type_code} do
      conn = put(conn, Routes.identification_type_code_path(conn, :update, identification_type_code), identification_type_code: @update_attrs)
      assert redirected_to(conn) == Routes.identification_type_code_path(conn, :show, identification_type_code)

      conn = get(conn, Routes.identification_type_code_path(conn, :show, identification_type_code))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, identification_type_code: identification_type_code} do
      conn = put(conn, Routes.identification_type_code_path(conn, :update, identification_type_code), identification_type_code: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Identification type code"
    end
  end

  describe "delete identification_type_code" do
    setup [:create_identification_type_code]

    test "deletes chosen identification_type_code", %{conn: conn, identification_type_code: identification_type_code} do
      conn = delete(conn, Routes.identification_type_code_path(conn, :delete, identification_type_code))
      assert redirected_to(conn) == Routes.identification_type_code_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.identification_type_code_path(conn, :show, identification_type_code))
      end
    end
  end

  defp create_identification_type_code(_) do
    identification_type_code = fixture(:identification_type_code)
    %{identification_type_code: identification_type_code}
  end
end
