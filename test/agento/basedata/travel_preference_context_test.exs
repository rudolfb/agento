defmodule Agento.Basedata.TravelPreferenceContextTest do
  use Agento.DataCase

  alias Agento.Basedata.TravelPreferenceContext

  describe "travelcardtypes" do
    alias Agento.Basedata.TravelPreferenceContext.TravelCardType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def travel_card_type_fixture(attrs \\ %{}) do
      {:ok, travel_card_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TravelPreferenceContext.create_travel_card_type()

      travel_card_type
    end

    test "list_travelcardtypes/0 returns all travelcardtypes" do
      travel_card_type = travel_card_type_fixture()
      assert TravelPreferenceContext.list_travelcardtypes() == [travel_card_type]
    end

    test "get_travel_card_type!/1 returns the travel_card_type with given id" do
      travel_card_type = travel_card_type_fixture()
      assert TravelPreferenceContext.get_travel_card_type!(travel_card_type.id) == travel_card_type
    end

    test "create_travel_card_type/1 with valid data creates a travel_card_type" do
      assert {:ok, %TravelCardType{} = travel_card_type} = TravelPreferenceContext.create_travel_card_type(@valid_attrs)
      assert travel_card_type.name == "some name"
    end

    test "create_travel_card_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.create_travel_card_type(@invalid_attrs)
    end

    test "update_travel_card_type/2 with valid data updates the travel_card_type" do
      travel_card_type = travel_card_type_fixture()
      assert {:ok, %TravelCardType{} = travel_card_type} = TravelPreferenceContext.update_travel_card_type(travel_card_type, @update_attrs)
      assert travel_card_type.name == "some updated name"
    end

    test "update_travel_card_type/2 with invalid data returns error changeset" do
      travel_card_type = travel_card_type_fixture()
      assert {:error, %Ecto.Changeset{}} = TravelPreferenceContext.update_travel_card_type(travel_card_type, @invalid_attrs)
      assert travel_card_type == TravelPreferenceContext.get_travel_card_type!(travel_card_type.id)
    end

    test "delete_travel_card_type/1 deletes the travel_card_type" do
      travel_card_type = travel_card_type_fixture()
      assert {:ok, %TravelCardType{}} = TravelPreferenceContext.delete_travel_card_type(travel_card_type)
      assert_raise Ecto.NoResultsError, fn -> TravelPreferenceContext.get_travel_card_type!(travel_card_type.id) end
    end

    test "change_travel_card_type/1 returns a travel_card_type changeset" do
      travel_card_type = travel_card_type_fixture()
      assert %Ecto.Changeset{} = TravelPreferenceContext.change_travel_card_type(travel_card_type)
    end
  end
end
