defmodule AgentoWeb.LanguageControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.LanguageContext

  @create_attrs %{bcode: "some bcode", code2: "some code2", code3: "some code3", is_child: true, is_correspondance_language: true, is_correspondance_language_active: true, is_visible: true, language_name: "some language_name", macro_language_code: "some macro_language_code", macro_language_name: "some macro_language_name", scope: "some scope", sort_order: 42, tcode: "some tcode", type: "some type"}
  @update_attrs %{bcode: "some updated bcode", code2: "some updated code2", code3: "some updated code3", is_child: false, is_correspondance_language: false, is_correspondance_language_active: false, is_visible: false, language_name: "some updated language_name", macro_language_code: "some updated macro_language_code", macro_language_name: "some updated macro_language_name", scope: "some updated scope", sort_order: 43, tcode: "some updated tcode", type: "some updated type"}
  @invalid_attrs %{bcode: nil, code2: nil, code3: nil, is_child: nil, is_correspondance_language: nil, is_correspondance_language_active: nil, is_visible: nil, language_name: nil, macro_language_code: nil, macro_language_name: nil, scope: nil, sort_order: nil, tcode: nil, type: nil}

  def fixture(:language) do
    {:ok, language} = LanguageContext.create_language(@create_attrs)
    language
  end

  describe "index" do
    test "lists all languages", %{conn: conn} do
      conn = get(conn, Routes.language_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Languages"
    end
  end

  describe "new language" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.language_path(conn, :new))
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "create language" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.language_path(conn, :create), language: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.language_path(conn, :show, id)

      conn = get(conn, Routes.language_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Language"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.language_path(conn, :create), language: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "edit language" do
    setup [:create_language]

    test "renders form for editing chosen language", %{conn: conn, language: language} do
      conn = get(conn, Routes.language_path(conn, :edit, language))
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "update language" do
    setup [:create_language]

    test "redirects when data is valid", %{conn: conn, language: language} do
      conn = put(conn, Routes.language_path(conn, :update, language), language: @update_attrs)
      assert redirected_to(conn) == Routes.language_path(conn, :show, language)

      conn = get(conn, Routes.language_path(conn, :show, language))
      assert html_response(conn, 200) =~ "some updated bcode"
    end

    test "renders errors when data is invalid", %{conn: conn, language: language} do
      conn = put(conn, Routes.language_path(conn, :update, language), language: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "delete language" do
    setup [:create_language]

    test "deletes chosen language", %{conn: conn, language: language} do
      conn = delete(conn, Routes.language_path(conn, :delete, language))
      assert redirected_to(conn) == Routes.language_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.language_path(conn, :show, language))
      end
    end
  end

  defp create_language(_) do
    language = fixture(:language)
    %{language: language}
  end
end
