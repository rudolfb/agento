defmodule AgentoWeb.TravelCardTypeControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.TravelCardTypeContext

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:travel_card_type) do
    {:ok, travel_card_type} = TravelCardTypeContext.create_travel_card_type(@create_attrs)
    travel_card_type
  end

  describe "index" do
    test "lists all travelcardtypes", %{conn: conn} do
      conn = get(conn, Routes.travel_card_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Travelcardtypes"
    end
  end

  describe "new travel_card_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.travel_card_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Travel card type"
    end
  end

  describe "create travel_card_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_card_type_path(conn, :create), travel_card_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.travel_card_type_path(conn, :show, id)

      conn = get(conn, Routes.travel_card_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Travel card type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_card_type_path(conn, :create), travel_card_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Travel card type"
    end
  end

  describe "edit travel_card_type" do
    setup [:create_travel_card_type]

    test "renders form for editing chosen travel_card_type", %{conn: conn, travel_card_type: travel_card_type} do
      conn = get(conn, Routes.travel_card_type_path(conn, :edit, travel_card_type))
      assert html_response(conn, 200) =~ "Edit Travel card type"
    end
  end

  describe "update travel_card_type" do
    setup [:create_travel_card_type]

    test "redirects when data is valid", %{conn: conn, travel_card_type: travel_card_type} do
      conn = put(conn, Routes.travel_card_type_path(conn, :update, travel_card_type), travel_card_type: @update_attrs)
      assert redirected_to(conn) == Routes.travel_card_type_path(conn, :show, travel_card_type)

      conn = get(conn, Routes.travel_card_type_path(conn, :show, travel_card_type))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, travel_card_type: travel_card_type} do
      conn = put(conn, Routes.travel_card_type_path(conn, :update, travel_card_type), travel_card_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Travel card type"
    end
  end

  describe "delete travel_card_type" do
    setup [:create_travel_card_type]

    test "deletes chosen travel_card_type", %{conn: conn, travel_card_type: travel_card_type} do
      conn = delete(conn, Routes.travel_card_type_path(conn, :delete, travel_card_type))
      assert redirected_to(conn) == Routes.travel_card_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.travel_card_type_path(conn, :show, travel_card_type))
      end
    end
  end

  defp create_travel_card_type(_) do
    travel_card_type = fixture(:travel_card_type)
    %{travel_card_type: travel_card_type}
  end
end
