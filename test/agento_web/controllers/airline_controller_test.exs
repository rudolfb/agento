defmodule AgentoWeb.AirlineControllerTest do
  use AgentoWeb.ConnCase

  alias Agento.Basedata.AirlineContext

  @create_attrs %{active: true, alias: "some alias", callsign: "some callsign", country_name: "some country_name", iata: "some iata", icao: "some icao", id_nr: "some id_nr", name: "some name"}
  @update_attrs %{active: false, alias: "some updated alias", callsign: "some updated callsign", country_name: "some updated country_name", iata: "some updated iata", icao: "some updated icao", id_nr: "some updated id_nr", name: "some updated name"}
  @invalid_attrs %{active: nil, alias: nil, callsign: nil, country_name: nil, iata: nil, icao: nil, id_nr: nil, name: nil}

  def fixture(:airline) do
    {:ok, airline} = AirlineContext.create_airline(@create_attrs)
    airline
  end

  describe "index" do
    test "lists all airlines", %{conn: conn} do
      conn = get(conn, Routes.airline_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Airlines"
    end
  end

  describe "new airline" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.airline_path(conn, :new))
      assert html_response(conn, 200) =~ "New Airline"
    end
  end

  describe "create airline" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.airline_path(conn, :create), airline: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.airline_path(conn, :show, id)

      conn = get(conn, Routes.airline_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Airline"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.airline_path(conn, :create), airline: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Airline"
    end
  end

  describe "edit airline" do
    setup [:create_airline]

    test "renders form for editing chosen airline", %{conn: conn, airline: airline} do
      conn = get(conn, Routes.airline_path(conn, :edit, airline))
      assert html_response(conn, 200) =~ "Edit Airline"
    end
  end

  describe "update airline" do
    setup [:create_airline]

    test "redirects when data is valid", %{conn: conn, airline: airline} do
      conn = put(conn, Routes.airline_path(conn, :update, airline), airline: @update_attrs)
      assert redirected_to(conn) == Routes.airline_path(conn, :show, airline)

      conn = get(conn, Routes.airline_path(conn, :show, airline))
      assert html_response(conn, 200) =~ "some updated alias"
    end

    test "renders errors when data is invalid", %{conn: conn, airline: airline} do
      conn = put(conn, Routes.airline_path(conn, :update, airline), airline: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Airline"
    end
  end

  describe "delete airline" do
    setup [:create_airline]

    test "deletes chosen airline", %{conn: conn, airline: airline} do
      conn = delete(conn, Routes.airline_path(conn, :delete, airline))
      assert redirected_to(conn) == Routes.airline_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.airline_path(conn, :show, airline))
      end
    end
  end

  defp create_airline(_) do
    airline = fixture(:airline)
    %{airline: airline}
  end
end
