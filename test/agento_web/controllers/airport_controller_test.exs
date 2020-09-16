defmodule AgentoWeb.AirportControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.AirportContext

  @create_attrs %{airport: "some airport", iata: "some iata", icao: "some icao", latitude: 120.5, longitude: 120.5, region_name: "some region_name"}
  @update_attrs %{airport: "some updated airport", iata: "some updated iata", icao: "some updated icao", latitude: 456.7, longitude: 456.7, region_name: "some updated region_name"}
  @invalid_attrs %{airport: nil, iata: nil, icao: nil, latitude: nil, longitude: nil, region_name: nil}

  def fixture(:airport) do
    {:ok, airport} = AirportContext.create_airport(@create_attrs)
    airport
  end

  describe "index" do
    test "lists all airports", %{conn: conn} do
      conn = get(conn, Routes.airport_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Airports"
    end
  end

  describe "new airport" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.airport_path(conn, :new))
      assert html_response(conn, 200) =~ "New Airport"
    end
  end

  describe "create airport" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.airport_path(conn, :create), airport: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.airport_path(conn, :show, id)

      conn = get(conn, Routes.airport_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Airport"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.airport_path(conn, :create), airport: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Airport"
    end
  end

  describe "edit airport" do
    setup [:create_airport]

    test "renders form for editing chosen airport", %{conn: conn, airport: airport} do
      conn = get(conn, Routes.airport_path(conn, :edit, airport))
      assert html_response(conn, 200) =~ "Edit Airport"
    end
  end

  describe "update airport" do
    setup [:create_airport]

    test "redirects when data is valid", %{conn: conn, airport: airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @update_attrs)
      assert redirected_to(conn) == Routes.airport_path(conn, :show, airport)

      conn = get(conn, Routes.airport_path(conn, :show, airport))
      assert html_response(conn, 200) =~ "some updated airport"
    end

    test "renders errors when data is invalid", %{conn: conn, airport: airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Airport"
    end
  end

  describe "delete airport" do
    setup [:create_airport]

    test "deletes chosen airport", %{conn: conn, airport: airport} do
      conn = delete(conn, Routes.airport_path(conn, :delete, airport))
      assert redirected_to(conn) == Routes.airport_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.airport_path(conn, :show, airport))
      end
    end
  end

  defp create_airport(_) do
    airport = fixture(:airport)
    %{airport: airport}
  end
end
