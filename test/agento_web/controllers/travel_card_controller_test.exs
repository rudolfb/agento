defmodule AgentoWeb.TravelCardControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.TravelCardContext

  @create_attrs %{expiration: ~N[2010-04-17 14:00:00], travelcardnumber: "some travelcardnumber"}
  @update_attrs %{expiration: ~N[2011-05-18 15:01:01], travelcardnumber: "some updated travelcardnumber"}
  @invalid_attrs %{expiration: nil, travelcardnumber: nil}

  def fixture(:travel_card) do
    {:ok, travel_card} = TravelCardContext.create_travel_card(@create_attrs)
    travel_card
  end

  describe "index" do
    test "lists all travelcards", %{conn: conn} do
      conn = get(conn, Routes.travel_card_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Travelcards"
    end
  end

  describe "new travel_card" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.travel_card_path(conn, :new))
      assert html_response(conn, 200) =~ "New Travel card"
    end
  end

  describe "create travel_card" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_card_path(conn, :create), travel_card: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.travel_card_path(conn, :show, id)

      conn = get(conn, Routes.travel_card_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Travel card"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_card_path(conn, :create), travel_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Travel card"
    end
  end

  describe "edit travel_card" do
    setup [:create_travel_card]

    test "renders form for editing chosen travel_card", %{conn: conn, travel_card: travel_card} do
      conn = get(conn, Routes.travel_card_path(conn, :edit, travel_card))
      assert html_response(conn, 200) =~ "Edit Travel card"
    end
  end

  describe "update travel_card" do
    setup [:create_travel_card]

    test "redirects when data is valid", %{conn: conn, travel_card: travel_card} do
      conn = put(conn, Routes.travel_card_path(conn, :update, travel_card), travel_card: @update_attrs)
      assert redirected_to(conn) == Routes.travel_card_path(conn, :show, travel_card)

      conn = get(conn, Routes.travel_card_path(conn, :show, travel_card))
      assert html_response(conn, 200) =~ "some updated travelcardnumber"
    end

    test "renders errors when data is invalid", %{conn: conn, travel_card: travel_card} do
      conn = put(conn, Routes.travel_card_path(conn, :update, travel_card), travel_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Travel card"
    end
  end

  describe "delete travel_card" do
    setup [:create_travel_card]

    test "deletes chosen travel_card", %{conn: conn, travel_card: travel_card} do
      conn = delete(conn, Routes.travel_card_path(conn, :delete, travel_card))
      assert redirected_to(conn) == Routes.travel_card_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.travel_card_path(conn, :show, travel_card))
      end
    end
  end

  defp create_travel_card(_) do
    travel_card = fixture(:travel_card)
    %{travel_card: travel_card}
  end
end
