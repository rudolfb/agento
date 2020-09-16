defmodule Agento.TravelPreferenceContextTest do
  use Agento.DataCase

  alias Agento.TravelPreferenceContext

  describe "travelpreferences" do
    alias Agento.TravelPreferenceContext.TravelPreference

    @valid_attrs %{has_wheelchair: true, homeairport_location: "some homeairport_location", labelname: "some labelname", mealtype_code: "some mealtype_code", preferred_aircraft_seat_type_code: "some preferred_aircraft_seat_type_code"}
    @update_attrs %{has_wheelchair: false, homeairport_location: "some updated homeairport_location", labelname: "some updated labelname", mealtype_code: "some updated mealtype_code", preferred_aircraft_seat_type_code: "some updated preferred_aircraft_seat_type_code"}
    @invalid_attrs %{has_wheelchair: nil, homeairport_location: nil, labelname: nil, mealtype_code: nil, preferred_aircraft_seat_type_code: nil}

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
end
