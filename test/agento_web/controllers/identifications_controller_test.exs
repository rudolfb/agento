defmodule AgentoWeb.IdentificationsControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.IdentificationContext

  @create_attrs %{dateofissue: ~N[2010-04-17 14:00:00], document_number: "some document_number", expirationdate: ~N[2010-04-17 14:00:00], identificationtypecode: "some identificationtypecode", is_main_passport: true, issuing_authority: "some issuing_authority", place_of_issue: "some place_of_issue"}
  @update_attrs %{dateofissue: ~N[2011-05-18 15:01:01], document_number: "some updated document_number", expirationdate: ~N[2011-05-18 15:01:01], identificationtypecode: "some updated identificationtypecode", is_main_passport: false, issuing_authority: "some updated issuing_authority", place_of_issue: "some updated place_of_issue"}
  @invalid_attrs %{dateofissue: nil, document_number: nil, expirationdate: nil, identificationtypecode: nil, is_main_passport: nil, issuing_authority: nil, place_of_issue: nil}

  def fixture(:identifications) do
    {:ok, identifications} = IdentificationContext.create_identifications(@create_attrs)
    identifications
  end

  describe "index" do
    test "lists all identification", %{conn: conn} do
      conn = get(conn, Routes.identifications_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Identification"
    end
  end

  describe "new identifications" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.identifications_path(conn, :new))
      assert html_response(conn, 200) =~ "New Identifications"
    end
  end

  describe "create identifications" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.identifications_path(conn, :create), identifications: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.identifications_path(conn, :show, id)

      conn = get(conn, Routes.identifications_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Identifications"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.identifications_path(conn, :create), identifications: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Identifications"
    end
  end

  describe "edit identifications" do
    setup [:create_identifications]

    test "renders form for editing chosen identifications", %{conn: conn, identifications: identifications} do
      conn = get(conn, Routes.identifications_path(conn, :edit, identifications))
      assert html_response(conn, 200) =~ "Edit Identifications"
    end
  end

  describe "update identifications" do
    setup [:create_identifications]

    test "redirects when data is valid", %{conn: conn, identifications: identifications} do
      conn = put(conn, Routes.identifications_path(conn, :update, identifications), identifications: @update_attrs)
      assert redirected_to(conn) == Routes.identifications_path(conn, :show, identifications)

      conn = get(conn, Routes.identifications_path(conn, :show, identifications))
      assert html_response(conn, 200) =~ "some updated document_number"
    end

    test "renders errors when data is invalid", %{conn: conn, identifications: identifications} do
      conn = put(conn, Routes.identifications_path(conn, :update, identifications), identifications: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Identifications"
    end
  end

  describe "delete identifications" do
    setup [:create_identifications]

    test "deletes chosen identifications", %{conn: conn, identifications: identifications} do
      conn = delete(conn, Routes.identifications_path(conn, :delete, identifications))
      assert redirected_to(conn) == Routes.identifications_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.identifications_path(conn, :show, identifications))
      end
    end
  end

  defp create_identifications(_) do
    identifications = fixture(:identifications)
    %{identifications: identifications}
  end
end
