defmodule Agento.FrequentFlyerCardContextTest do
  use Agento.DataCase

  alias Agento.FrequentFlyerCardContext

  describe "frequentflyercards" do
    alias Agento.FrequentFlyerCardContext.FrequentFlyerCard

    @valid_attrs %{airline_iata_code: "some airline_iata_code", airline_name: "some airline_name", frequent_flyer_number: "some frequent_flyer_number"}
    @update_attrs %{airline_iata_code: "some updated airline_iata_code", airline_name: "some updated airline_name", frequent_flyer_number: "some updated frequent_flyer_number"}
    @invalid_attrs %{airline_iata_code: nil, airline_name: nil, frequent_flyer_number: nil}

    def frequent_flyer_card_fixture(attrs \\ %{}) do
      {:ok, frequent_flyer_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> FrequentFlyerCardContext.create_frequent_flyer_card()

      frequent_flyer_card
    end

    test "list_frequentflyercards/0 returns all frequentflyercards" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert FrequentFlyerCardContext.list_frequentflyercards() == [frequent_flyer_card]
    end

    test "get_frequent_flyer_card!/1 returns the frequent_flyer_card with given id" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert FrequentFlyerCardContext.get_frequent_flyer_card!(frequent_flyer_card.id) == frequent_flyer_card
    end

    test "create_frequent_flyer_card/1 with valid data creates a frequent_flyer_card" do
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = FrequentFlyerCardContext.create_frequent_flyer_card(@valid_attrs)
      assert frequent_flyer_card.airline_iata_code == "some airline_iata_code"
      assert frequent_flyer_card.airline_name == "some airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some frequent_flyer_number"
    end

    test "create_frequent_flyer_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FrequentFlyerCardContext.create_frequent_flyer_card(@invalid_attrs)
    end

    test "update_frequent_flyer_card/2 with valid data updates the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = FrequentFlyerCardContext.update_frequent_flyer_card(frequent_flyer_card, @update_attrs)
      assert frequent_flyer_card.airline_iata_code == "some updated airline_iata_code"
      assert frequent_flyer_card.airline_name == "some updated airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some updated frequent_flyer_number"
    end

    test "update_frequent_flyer_card/2 with invalid data returns error changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:error, %Ecto.Changeset{}} = FrequentFlyerCardContext.update_frequent_flyer_card(frequent_flyer_card, @invalid_attrs)
      assert frequent_flyer_card == FrequentFlyerCardContext.get_frequent_flyer_card!(frequent_flyer_card.id)
    end

    test "delete_frequent_flyer_card/1 deletes the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{}} = FrequentFlyerCardContext.delete_frequent_flyer_card(frequent_flyer_card)
      assert_raise Ecto.NoResultsError, fn -> FrequentFlyerCardContext.get_frequent_flyer_card!(frequent_flyer_card.id) end
    end

    test "change_frequent_flyer_card/1 returns a frequent_flyer_card changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert %Ecto.Changeset{} = FrequentFlyerCardContext.change_frequent_flyer_card(frequent_flyer_card)
    end
  end
end
