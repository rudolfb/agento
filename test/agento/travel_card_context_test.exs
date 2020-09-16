defmodule Agento.TravelCardContextTest do
  use Agento.DataCase

  alias Agento.TravelCardContext

  describe "travelcards" do
    alias Agento.TravelCardContext.TravelCard

    @valid_attrs %{expiration: ~N[2010-04-17 14:00:00], travelcardnumber: "some travelcardnumber"}
    @update_attrs %{expiration: ~N[2011-05-18 15:01:01], travelcardnumber: "some updated travelcardnumber"}
    @invalid_attrs %{expiration: nil, travelcardnumber: nil}

    def travel_card_fixture(attrs \\ %{}) do
      {:ok, travel_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TravelCardContext.create_travel_card()

      travel_card
    end

    test "list_travelcards/0 returns all travelcards" do
      travel_card = travel_card_fixture()
      assert TravelCardContext.list_travelcards() == [travel_card]
    end

    test "get_travel_card!/1 returns the travel_card with given id" do
      travel_card = travel_card_fixture()
      assert TravelCardContext.get_travel_card!(travel_card.id) == travel_card
    end

    test "create_travel_card/1 with valid data creates a travel_card" do
      assert {:ok, %TravelCard{} = travel_card} = TravelCardContext.create_travel_card(@valid_attrs)
      assert travel_card.expiration == ~N[2010-04-17 14:00:00]
      assert travel_card.travelcardnumber == "some travelcardnumber"
    end

    test "create_travel_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TravelCardContext.create_travel_card(@invalid_attrs)
    end

    test "update_travel_card/2 with valid data updates the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{} = travel_card} = TravelCardContext.update_travel_card(travel_card, @update_attrs)
      assert travel_card.expiration == ~N[2011-05-18 15:01:01]
      assert travel_card.travelcardnumber == "some updated travelcardnumber"
    end

    test "update_travel_card/2 with invalid data returns error changeset" do
      travel_card = travel_card_fixture()
      assert {:error, %Ecto.Changeset{}} = TravelCardContext.update_travel_card(travel_card, @invalid_attrs)
      assert travel_card == TravelCardContext.get_travel_card!(travel_card.id)
    end

    test "delete_travel_card/1 deletes the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{}} = TravelCardContext.delete_travel_card(travel_card)
      assert_raise Ecto.NoResultsError, fn -> TravelCardContext.get_travel_card!(travel_card.id) end
    end

    test "change_travel_card/1 returns a travel_card changeset" do
      travel_card = travel_card_fixture()
      assert %Ecto.Changeset{} = TravelCardContext.change_travel_card(travel_card)
    end
  end
end
