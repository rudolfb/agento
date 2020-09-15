defmodule Agento.TravelPreferenceContextTest do
  use Agento.DataCase

  alias Agento.TravelPreferenceContext

  describe "travelpreferences" do
    alias Agento.TravelPreferenceContext.TravelPreference

    @valid_attrs %{has_wheelchair: true, homeairport_location: "some homeairport_location", labelname: "some labelname", mealtype_code: "some mealtype_code", preferred_aircraft_seat_type_code: "some preferred_aircraft_seat_type_code", smoker: true}
    @update_attrs %{has_wheelchair: false, homeairport_location: "some updated homeairport_location", labelname: "some updated labelname", mealtype_code: "some updated mealtype_code", preferred_aircraft_seat_type_code: "some updated preferred_aircraft_seat_type_code", smoker: false}
    @invalid_attrs %{has_wheelchair: nil, homeairport_location: nil, labelname: nil, mealtype_code: nil, preferred_aircraft_seat_type_code: nil, smoker: nil}

    def travel_preference_fixture(attrs \\ %{}) do
      {:ok, travel_preference} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TravelPreferenceContext.create_travel_preference()

      travel_preference
    end

    test "list_travelpreferences/0 returns all travelpreferences" do
      travel_preference = travel_preference_fixture()
      assert TravelPreferenceContext.list_travelpreferences() == [travel_preference]
    end

    test "get_travel_preference!/1 returns the travel_preference with given id" do
      travel_preference = travel_preference_fixture()
      assert TravelPreferenceContext.get_travel_preference!(travel_preference.id) == travel_preference
    end

    test "create_travel_preference/1 with valid data creates a travel_preference" do
      assert {:ok, %TravelPreference{} = travel_preference} = TravelPreferenceContext.create_travel_preference(@valid_attrs)
      assert travel_preference.has_wheelchair == true
      assert travel_preference.homeairport_location == "some homeairport_location"
      assert travel_preference.labelname == "some labelname"
      assert travel_preference.mealtype_code == "some mealtype_code"
      assert travel_preference.preferred_aircraft_seat_type_code == "some preferred_aircraft_seat_type_code"
      assert travel_preference.smoker == true
    end

    test "create_travel_preference/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.create_travel_preference(@invalid_attrs)
    end

    test "update_travel_preference/2 with valid data updates the travel_preference" do
      travel_preference = travel_preference_fixture()
      assert {:ok, %TravelPreference{} = travel_preference} = TravelPreferenceContext.update_travel_preference(travel_preference, @update_attrs)
      assert travel_preference.has_wheelchair == false
      assert travel_preference.homeairport_location == "some updated homeairport_location"
      assert travel_preference.labelname == "some updated labelname"
      assert travel_preference.mealtype_code == "some updated mealtype_code"
      assert travel_preference.preferred_aircraft_seat_type_code == "some updated preferred_aircraft_seat_type_code"
      assert travel_preference.smoker == false
    end

    test "update_travel_preference/2 with invalid data returns error changeset" do
      travel_preference = travel_preference_fixture()
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.update_travel_preference(travel_preference, @invalid_attrs)
      assert travel_preference == TravelPreferenceContext.get_travel_preference!(travel_preference.id)
    end

    test "delete_travel_preference/1 deletes the travel_preference" do
      travel_preference = travel_preference_fixture()
      assert {:ok, %TravelPreference{}} = TravelPreferenceContext.delete_travel_preference(travel_preference)
      assert_raise Ecto.NoResultsError, fn -> TravelPreferenceContext.get_travel_preference!(travel_preference.id) end
    end

    test "change_travel_preference/1 returns a travel_preference changeset" do
      travel_preference = travel_preference_fixture()
      assert %Ecto.Changeset{} = TravelPreferenceContext.change_travel_preference(travel_preference)
    end
  end

  describe "frequentflyercards" do
    alias Agento.TravelPreferenceContext.FrequentFlyerCard

    @valid_attrs %{airline_iata_code: "some airline_iata_code", airline_name: "some airline_name", frequent_flyer_number: "some frequent_flyer_number"}
    @update_attrs %{airline_iata_code: "some updated airline_iata_code", airline_name: "some updated airline_name", frequent_flyer_number: "some updated frequent_flyer_number"}
    @invalid_attrs %{airline_iata_code: nil, airline_name: nil, frequent_flyer_number: nil}

    def frequent_flyer_card_fixture(attrs \\ %{}) do
      {:ok, frequent_flyer_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TravelPreferenceContext.create_frequent_flyer_card()

      frequent_flyer_card
    end

    test "list_frequentflyercards/0 returns all frequentflyercards" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert TravelPreferenceContext.list_frequentflyercards() == [frequent_flyer_card]
    end

    test "get_frequent_flyer_card!/1 returns the frequent_flyer_card with given id" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert TravelPreferenceContext.get_frequent_flyer_card!(frequent_flyer_card.id) == frequent_flyer_card
    end

    test "create_frequent_flyer_card/1 with valid data creates a frequent_flyer_card" do
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = TravelPreferenceContext.create_frequent_flyer_card(@valid_attrs)
      assert frequent_flyer_card.airline_iata_code == "some airline_iata_code"
      assert frequent_flyer_card.airline_name == "some airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some frequent_flyer_number"
    end

    test "create_frequent_flyer_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.create_frequent_flyer_card(@invalid_attrs)
    end

    test "update_frequent_flyer_card/2 with valid data updates the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = TravelPreferenceContext.update_frequent_flyer_card(frequent_flyer_card, @update_attrs)
      assert frequent_flyer_card.airline_iata_code == "some updated airline_iata_code"
      assert frequent_flyer_card.airline_name == "some updated airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some updated frequent_flyer_number"
    end

    test "update_frequent_flyer_card/2 with invalid data returns error changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.update_frequent_flyer_card(frequent_flyer_card, @invalid_attrs)
      assert frequent_flyer_card == TravelPreferenceContext.get_frequent_flyer_card!(frequent_flyer_card.id)
    end

    test "delete_frequent_flyer_card/1 deletes the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{}} = TravelPreferenceContext.delete_frequent_flyer_card(frequent_flyer_card)
      assert_raise Ecto.NoResultsError, fn -> TravelPreferenceContext.get_frequent_flyer_card!(frequent_flyer_card.id) end
    end

    test "change_frequent_flyer_card/1 returns a frequent_flyer_card changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert %Ecto.Changeset{} = TravelPreferenceContext.change_frequent_flyer_card(frequent_flyer_card)
    end
  end

  describe "travelcards" do
    alias Agento.TravelPreferenceContext.TravelCard

    @valid_attrs %{expiration: ~N[2010-04-17 14:00:00], travelcardnumber: "some travelcardnumber"}
    @update_attrs %{expiration: ~N[2011-05-18 15:01:01], travelcardnumber: "some updated travelcardnumber"}
    @invalid_attrs %{expiration: nil, travelcardnumber: nil}

    def travel_card_fixture(attrs \\ %{}) do
      {:ok, travel_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TravelPreferenceContext.create_travel_card()

      travel_card
    end

    test "list_travelcards/0 returns all travelcards" do
      travel_card = travel_card_fixture()
      assert TravelPreferenceContext.list_travelcards() == [travel_card]
    end

    test "get_travel_card!/1 returns the travel_card with given id" do
      travel_card = travel_card_fixture()
      assert TravelPreferenceContext.get_travel_card!(travel_card.id) == travel_card
    end

    test "create_travel_card/1 with valid data creates a travel_card" do
      assert {:ok, %TravelCard{} = travel_card} = TravelPreferenceContext.create_travel_card(@valid_attrs)
      assert travel_card.expiration == ~N[2010-04-17 14:00:00]
      assert travel_card.travelcardnumber == "some travelcardnumber"
    end

    test "create_travel_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.create_travel_card(@invalid_attrs)
    end

    test "update_travel_card/2 with valid data updates the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{} = travel_card} = TravelPreferenceContext.update_travel_card(travel_card, @update_attrs)
      assert travel_card.expiration == ~N[2011-05-18 15:01:01]
      assert travel_card.travelcardnumber == "some updated travelcardnumber"
    end

    test "update_travel_card/2 with invalid data returns error changeset" do
      travel_card = travel_card_fixture()
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.update_travel_card(travel_card, @invalid_attrs)
      assert travel_card == TravelPreferenceContext.get_travel_card!(travel_card.id)
    end

    test "delete_travel_card/1 deletes the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{}} = TravelPreferenceContext.delete_travel_card(travel_card)
      assert_raise Ecto.NoResultsError, fn -> TravelPreferenceContext.get_travel_card!(travel_card.id) end
    end

    test "change_travel_card/1 returns a travel_card changeset" do
      travel_card = travel_card_fixture()
      assert %Ecto.Changeset{} = TravelPreferenceContext.change_travel_card(travel_card)
    end
  end
end
