defmodule Agento.Basedata.AirlineContextTest do
  use Agento.DataCase

  alias Agento.Basedata.AirlineContext

  describe "airlines" do
    alias Agento.Basedata.AirlineContext.Airline

    @valid_attrs %{active: true, alias: "some alias", callsign: "some callsign", country_name: "some country_name", iata: "some iata", icao: "some icao", id_nr: "some id_nr", name: "some name"}
    @update_attrs %{active: false, alias: "some updated alias", callsign: "some updated callsign", country_name: "some updated country_name", iata: "some updated iata", icao: "some updated icao", id_nr: "some updated id_nr", name: "some updated name"}
    @invalid_attrs %{active: nil, alias: nil, callsign: nil, country_name: nil, iata: nil, icao: nil, id_nr: nil, name: nil}

    def airline_fixture(attrs \\ %{}) do
      {:ok, airline} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AirlineContext.create_airline()

      airline
    end

    test "list_airlines/0 returns all airlines" do
      airline = airline_fixture()
      assert AirlineContext.list_airlines() == [airline]
    end

    test "get_airline!/1 returns the airline with given id" do
      airline = airline_fixture()
      assert AirlineContext.get_airline!(airline.id) == airline
    end

    test "create_airline/1 with valid data creates a airline" do
      assert {:ok, %Airline{} = airline} = AirlineContext.create_airline(@valid_attrs)
      assert airline.active == true
      assert airline.alias == "some alias"
      assert airline.callsign == "some callsign"
      assert airline.country_name == "some country_name"
      assert airline.iata == "some iata"
      assert airline.icao == "some icao"
      assert airline.id_nr == "some id_nr"
      assert airline.name == "some name"
    end

    test "create_airline/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AirlineContext.create_airline(@invalid_attrs)
    end

    test "update_airline/2 with valid data updates the airline" do
      airline = airline_fixture()
      assert {:ok, %Airline{} = airline} = AirlineContext.update_airline(airline, @update_attrs)
      assert airline.active == false
      assert airline.alias == "some updated alias"
      assert airline.callsign == "some updated callsign"
      assert airline.country_name == "some updated country_name"
      assert airline.iata == "some updated iata"
      assert airline.icao == "some updated icao"
      assert airline.id_nr == "some updated id_nr"
      assert airline.name == "some updated name"
    end

    test "update_airline/2 with invalid data returns error changeset" do
      airline = airline_fixture()
      assert {:error, %Ecto.Changeset{}} = AirlineContext.update_airline(airline, @invalid_attrs)
      assert airline == AirlineContext.get_airline!(airline.id)
    end

    test "delete_airline/1 deletes the airline" do
      airline = airline_fixture()
      assert {:ok, %Airline{}} = AirlineContext.delete_airline(airline)
      assert_raise Ecto.NoResultsError, fn -> AirlineContext.get_airline!(airline.id) end
    end

    test "change_airline/1 returns a airline changeset" do
      airline = airline_fixture()
      assert %Ecto.Changeset{} = AirlineContext.change_airline(airline)
    end
  end
end
