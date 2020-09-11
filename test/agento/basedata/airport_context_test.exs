defmodule Agento.Basedata.AirportContextTest do
  use Agento.DataCase

  alias Agento.Basedata.AirportContext

  describe "airports" do
    alias Agento.Basedata.AirportContext.Airport

    @valid_attrs %{airport: "some airport", iata: "some iata", icao: "some icao", latitude: 120.5, longitude: 120.5, region_name: "some region_name"}
    @update_attrs %{airport: "some updated airport", iata: "some updated iata", icao: "some updated icao", latitude: 456.7, longitude: 456.7, region_name: "some updated region_name"}
    @invalid_attrs %{airport: nil, iata: nil, icao: nil, latitude: nil, longitude: nil, region_name: nil}

    def airport_fixture(attrs \\ %{}) do
      {:ok, airport} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AirportContext.create_airport()

      airport
    end

    test "list_airports/0 returns all airports" do
      airport = airport_fixture()
      assert AirportContext.list_airports() == [airport]
    end

    test "get_airport!/1 returns the airport with given id" do
      airport = airport_fixture()
      assert AirportContext.get_airport!(airport.id) == airport
    end

    test "create_airport/1 with valid data creates a airport" do
      assert {:ok, %Airport{} = airport} = AirportContext.create_airport(@valid_attrs)
      assert airport.airport == "some airport"
      assert airport.iata == "some iata"
      assert airport.icao == "some icao"
      assert airport.latitude == 120.5
      assert airport.longitude == 120.5
      assert airport.region_name == "some region_name"
    end

    test "create_airport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AirportContext.create_airport(@invalid_attrs)
    end

    test "update_airport/2 with valid data updates the airport" do
      airport = airport_fixture()
      assert {:ok, %Airport{} = airport} = AirportContext.update_airport(airport, @update_attrs)
      assert airport.airport == "some updated airport"
      assert airport.iata == "some updated iata"
      assert airport.icao == "some updated icao"
      assert airport.latitude == 456.7
      assert airport.longitude == 456.7
      assert airport.region_name == "some updated region_name"
    end

    test "update_airport/2 with invalid data returns error changeset" do
      airport = airport_fixture()
      assert {:error, %Ecto.Changeset{}} = AirportContext.update_airport(airport, @invalid_attrs)
      assert airport == AirportContext.get_airport!(airport.id)
    end

    test "delete_airport/1 deletes the airport" do
      airport = airport_fixture()
      assert {:ok, %Airport{}} = AirportContext.delete_airport(airport)
      assert_raise Ecto.NoResultsError, fn -> AirportContext.get_airport!(airport.id) end
    end

    test "change_airport/1 returns a airport changeset" do
      airport = airport_fixture()
      assert %Ecto.Changeset{} = AirportContext.change_airport(airport)
    end
  end
end
