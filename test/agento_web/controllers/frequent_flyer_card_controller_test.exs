defmodule AgentoWeb.FrequentFlyerCardControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.TravelPreferenceContext

  @create_attrs %{airline_iata_code: "some airline_iata_code", airline_name: "some airline_name", frequent_flyer_number: "some frequent_flyer_number"}
  @update_attrs %{airline_iata_code: "some updated airline_iata_code", airline_name: "some updated airline_name", frequent_flyer_number: "some updated frequent_flyer_number"}
  @invalid_attrs %{airline_iata_code: nil, airline_name: nil, frequent_flyer_number: nil}

  def fixture(:frequent_flyer_card) do
    {:ok, frequent_flyer_card} = TravelPreferenceContext.create_frequent_flyer_card(@create_attrs)
    frequent_flyer_card
  end

  describe "index" do
    test "lists all frequentflyercards", %{conn: conn} do
      conn = get(conn, Routes.frequent_flyer_card_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Frequentflyercards"
    end
  end

  describe "new frequent_flyer_card" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.frequent_flyer_card_path(conn, :new))
      assert html_response(conn, 200) =~ "New Frequent flyer card"
    end
  end

  describe "create frequent_flyer_card" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.frequent_flyer_card_path(conn, :create), frequent_flyer_card: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.frequent_flyer_card_path(conn, :show, id)

      conn = get(conn, Routes.frequent_flyer_card_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Frequent flyer card"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.frequent_flyer_card_path(conn, :create), frequent_flyer_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Frequent flyer card"
    end
  end

  describe "edit frequent_flyer_card" do
    setup [:create_frequent_flyer_card]

    test "renders form for editing chosen frequent_flyer_card", %{conn: conn, frequent_flyer_card: frequent_flyer_card} do
      conn = get(conn, Routes.frequent_flyer_card_path(conn, :edit, frequent_flyer_card))
      assert html_response(conn, 200) =~ "Edit Frequent flyer card"
    end
  end

  describe "update frequent_flyer_card" do
    setup [:create_frequent_flyer_card]

    test "redirects when data is valid", %{conn: conn, frequent_flyer_card: frequent_flyer_card} do
      conn = put(conn, Routes.frequent_flyer_card_path(conn, :update, frequent_flyer_card), frequent_flyer_card: @update_attrs)
      assert redirected_to(conn) == Routes.frequent_flyer_card_path(conn, :show, frequent_flyer_card)

      conn = get(conn, Routes.frequent_flyer_card_path(conn, :show, frequent_flyer_card))
      assert html_response(conn, 200) =~ "some updated airline_iata_code"
    end

    test "renders errors when data is invalid", %{conn: conn, frequent_flyer_card: frequent_flyer_card} do
      conn = put(conn, Routes.frequent_flyer_card_path(conn, :update, frequent_flyer_card), frequent_flyer_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Frequent flyer card"
    end
  end

  describe "delete frequent_flyer_card" do
    setup [:create_frequent_flyer_card]

    test "deletes chosen frequent_flyer_card", %{conn: conn, frequent_flyer_card: frequent_flyer_card} do
      conn = delete(conn, Routes.frequent_flyer_card_path(conn, :delete, frequent_flyer_card))
      assert redirected_to(conn) == Routes.frequent_flyer_card_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.frequent_flyer_card_path(conn, :show, frequent_flyer_card))
      end
    end
  end

  defp create_frequent_flyer_card(_) do
    frequent_flyer_card = fixture(:frequent_flyer_card)
    %{frequent_flyer_card: frequent_flyer_card}
  end
end
