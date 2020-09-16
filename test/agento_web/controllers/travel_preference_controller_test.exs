defmodule AgentoWeb.TravelPreferenceControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.TravelPreferenceContext

  @create_attrs %{has_wheelchair: true, homeairport_location: "some homeairport_location", labelname: "some labelname", mealtype_code: "some mealtype_code", preferred_aircraft_seat_type_code: "some preferred_aircraft_seat_type_code"}
  @update_attrs %{has_wheelchair: false, homeairport_location: "some updated homeairport_location", labelname: "some updated labelname", mealtype_code: "some updated mealtype_code", preferred_aircraft_seat_type_code: "some updated preferred_aircraft_seat_type_code"}
  @invalid_attrs %{has_wheelchair: nil, homeairport_location: nil, labelname: nil, mealtype_code: nil, preferred_aircraft_seat_type_code: nil}

  def fixture(:travel_preference) do
    {:ok, travel_preference} = TravelPreferenceContext.create_travel_preference(@create_attrs)
    travel_preference
  end

  describe "index" do
    test "lists all travelpreferences", %{conn: conn} do
      conn = get(conn, Routes.travel_preference_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Travelpreferences"
    end
  end

  describe "new travel_preference" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.travel_preference_path(conn, :new))
      assert html_response(conn, 200) =~ "New Travel preference"
    end
  end

  describe "create travel_preference" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_preference_path(conn, :create), travel_preference: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.travel_preference_path(conn, :show, id)

      conn = get(conn, Routes.travel_preference_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Travel preference"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_preference_path(conn, :create), travel_preference: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Travel preference"
    end
  end

  describe "edit travel_preference" do
    setup [:create_travel_preference]

    test "renders form for editing chosen travel_preference", %{conn: conn, travel_preference: travel_preference} do
      conn = get(conn, Routes.travel_preference_path(conn, :edit, travel_preference))
      assert html_response(conn, 200) =~ "Edit Travel preference"
    end
  end

  describe "update travel_preference" do
    setup [:create_travel_preference]

    test "redirects when data is valid", %{conn: conn, travel_preference: travel_preference} do
      conn = put(conn, Routes.travel_preference_path(conn, :update, travel_preference), travel_preference: @update_attrs)
      assert redirected_to(conn) == Routes.travel_preference_path(conn, :show, travel_preference)

      conn = get(conn, Routes.travel_preference_path(conn, :show, travel_preference))
      assert html_response(conn, 200) =~ "some updated homeairport_location"
    end

    test "renders errors when data is invalid", %{conn: conn, travel_preference: travel_preference} do
      conn = put(conn, Routes.travel_preference_path(conn, :update, travel_preference), travel_preference: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Travel preference"
    end
  end

  describe "delete travel_preference" do
    setup [:create_travel_preference]

    test "deletes chosen travel_preference", %{conn: conn, travel_preference: travel_preference} do
      conn = delete(conn, Routes.travel_preference_path(conn, :delete, travel_preference))
      assert redirected_to(conn) == Routes.travel_preference_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.travel_preference_path(conn, :show, travel_preference))
      end
    end
  end

  defp create_travel_preference(_) do
    travel_preference = fixture(:travel_preference)
    %{travel_preference: travel_preference}
  end
end
