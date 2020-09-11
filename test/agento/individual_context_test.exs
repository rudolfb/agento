defmodule Agento.IndividualContextTest do
  use Agento.DataCase

  alias Agento.IndividualContext

  describe "individuals" do
    alias Agento.IndividualContext.Individual

    @valid_attrs %{birthdate: ~D[2010-04-17], dateofdeath: ~D[2010-04-17], displayname: "some displayname", firstname: "some firstname", gender: "some gender", is_deleted: true, lastname: "some lastname", native_language_code: "some native_language_code"}
    @update_attrs %{birthdate: ~D[2011-05-18], dateofdeath: ~D[2011-05-18], displayname: "some updated displayname", firstname: "some updated firstname", gender: "some updated gender", is_deleted: false, lastname: "some updated lastname", native_language_code: "some updated native_language_code"}
    @invalid_attrs %{birthdate: nil, dateofdeath: nil, displayname: nil, firstname: nil, gender: nil, is_deleted: nil, lastname: nil, native_language_code: nil}

    def individual_fixture(attrs \\ %{}) do
      {:ok, individual} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_individual()

      individual
    end

    test "list_individuals/0 returns all individuals" do
      individual = individual_fixture()
      assert IndividualContext.list_individuals() == [individual]
    end

    test "get_individual!/1 returns the individual with given id" do
      individual = individual_fixture()
      assert IndividualContext.get_individual!(individual.id) == individual
    end

    test "create_individual/1 with valid data creates a individual" do
      assert {:ok, %Individual{} = individual} = IndividualContext.create_individual(@valid_attrs)
      assert individual.birthdate == ~D[2010-04-17]
      assert individual.dateofdeath == ~D[2010-04-17]
      assert individual.displayname == "some displayname"
      assert individual.firstname == "some firstname"
      assert individual.gender == "some gender"
      assert individual.is_deleted == true
      assert individual.lastname == "some lastname"
      assert individual.native_language_code == "some native_language_code"
    end

    test "create_individual/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_individual(@invalid_attrs)
    end

    test "update_individual/2 with valid data updates the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{} = individual} = IndividualContext.update_individual(individual, @update_attrs)
      assert individual.birthdate == ~D[2011-05-18]
      assert individual.dateofdeath == ~D[2011-05-18]
      assert individual.displayname == "some updated displayname"
      assert individual.firstname == "some updated firstname"
      assert individual.gender == "some updated gender"
      assert individual.is_deleted == false
      assert individual.lastname == "some updated lastname"
      assert individual.native_language_code == "some updated native_language_code"
    end

    test "update_individual/2 with invalid data returns error changeset" do
      individual = individual_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_individual(individual, @invalid_attrs)
      assert individual == IndividualContext.get_individual!(individual.id)
    end

    test "delete_individual/1 deletes the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{}} = IndividualContext.delete_individual(individual)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_individual!(individual.id) end
    end

    test "change_individual/1 returns a individual changeset" do
      individual = individual_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_individual(individual)
    end
  end

  describe "individuals_addresses" do
    alias Agento.IndividualContext.IndividualAddress

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def individual_address_fixture(attrs \\ %{}) do
      {:ok, individual_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_individual_address()

      individual_address
    end

    test "list_individuals_addresses/0 returns all individuals_addresses" do
      individual_address = individual_address_fixture()
      assert IndividualContext.list_individuals_addresses() == [individual_address]
    end

    test "get_individual_address!/1 returns the individual_address with given id" do
      individual_address = individual_address_fixture()
      assert IndividualContext.get_individual_address!(individual_address.id) == individual_address
    end

    test "create_individual_address/1 with valid data creates a individual_address" do
      assert {:ok, %IndividualAddress{} = individual_address} = IndividualContext.create_individual_address(@valid_attrs)
    end

    test "create_individual_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_individual_address(@invalid_attrs)
    end

    test "update_individual_address/2 with valid data updates the individual_address" do
      individual_address = individual_address_fixture()
      assert {:ok, %IndividualAddress{} = individual_address} = IndividualContext.update_individual_address(individual_address, @update_attrs)
    end

    test "update_individual_address/2 with invalid data returns error changeset" do
      individual_address = individual_address_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_individual_address(individual_address, @invalid_attrs)
      assert individual_address == IndividualContext.get_individual_address!(individual_address.id)
    end

    test "delete_individual_address/1 deletes the individual_address" do
      individual_address = individual_address_fixture()
      assert {:ok, %IndividualAddress{}} = IndividualContext.delete_individual_address(individual_address)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_individual_address!(individual_address.id) end
    end

    test "change_individual_address/1 returns a individual_address changeset" do
      individual_address = individual_address_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_individual_address(individual_address)
    end
  end

  describe "individuals_communications" do
    alias Agento.IndividualContext.IndividualCommunication

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def individual_communication_fixture(attrs \\ %{}) do
      {:ok, individual_communication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_individual_communication()

      individual_communication
    end

    test "list_individuals_communications/0 returns all individuals_communications" do
      individual_communication = individual_communication_fixture()
      assert IndividualContext.list_individuals_communications() == [individual_communication]
    end

    test "get_individual_communication!/1 returns the individual_communication with given id" do
      individual_communication = individual_communication_fixture()
      assert IndividualContext.get_individual_communication!(individual_communication.id) == individual_communication
    end

    test "create_individual_communication/1 with valid data creates a individual_communication" do
      assert {:ok, %IndividualCommunication{} = individual_communication} = IndividualContext.create_individual_communication(@valid_attrs)
    end

    test "create_individual_communication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_individual_communication(@invalid_attrs)
    end

    test "update_individual_communication/2 with valid data updates the individual_communication" do
      individual_communication = individual_communication_fixture()
      assert {:ok, %IndividualCommunication{} = individual_communication} = IndividualContext.update_individual_communication(individual_communication, @update_attrs)
    end

    test "update_individual_communication/2 with invalid data returns error changeset" do
      individual_communication = individual_communication_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_individual_communication(individual_communication, @invalid_attrs)
      assert individual_communication == IndividualContext.get_individual_communication!(individual_communication.id)
    end

    test "delete_individual_communication/1 deletes the individual_communication" do
      individual_communication = individual_communication_fixture()
      assert {:ok, %IndividualCommunication{}} = IndividualContext.delete_individual_communication(individual_communication)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_individual_communication!(individual_communication.id) end
    end

    test "change_individual_communication/1 returns a individual_communication changeset" do
      individual_communication = individual_communication_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_individual_communication(individual_communication)
    end
  end

  describe "travelpreferences" do
    alias Agento.IndividualContext.TravelPreference

    @valid_attrs %{has_wheelchair: true, homeairport_location: "some homeairport_location", labelname: "some labelname", mealtype_code: "some mealtype_code", preferred_aircraft_seat_type_code: "some preferred_aircraft_seat_type_code"}
    @update_attrs %{has_wheelchair: false, homeairport_location: "some updated homeairport_location", labelname: "some updated labelname", mealtype_code: "some updated mealtype_code", preferred_aircraft_seat_type_code: "some updated preferred_aircraft_seat_type_code"}
    @invalid_attrs %{has_wheelchair: nil, homeairport_location: nil, labelname: nil, mealtype_code: nil, preferred_aircraft_seat_type_code: nil}

    def travel_preference_fixture(attrs \\ %{}) do
      {:ok, travel_preference} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_travel_preference()

      travel_preference
    end

    test "list_travelpreferences/0 returns all travelpreferences" do
      travel_preference = travel_preference_fixture()
      assert IndividualContext.list_travelpreferences() == [travel_preference]
    end

    test "get_travel_preference!/1 returns the travel_preference with given id" do
      travel_preference = travel_preference_fixture()
      assert IndividualContext.get_travel_preference!(travel_preference.id) == travel_preference
    end

    test "create_travel_preference/1 with valid data creates a travel_preference" do
      assert {:ok, %TravelPreference{} = travel_preference} = IndividualContext.create_travel_preference(@valid_attrs)
      assert travel_preference.has_wheelchair == true
      assert travel_preference.homeairport_location == "some homeairport_location"
      assert travel_preference.labelname == "some labelname"
      assert travel_preference.mealtype_code == "some mealtype_code"
      assert travel_preference.preferred_aircraft_seat_type_code == "some preferred_aircraft_seat_type_code"
    end

    test "create_travel_preference/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_travel_preference(@invalid_attrs)
    end

    test "update_travel_preference/2 with valid data updates the travel_preference" do
      travel_preference = travel_preference_fixture()
      assert {:ok, %TravelPreference{} = travel_preference} = IndividualContext.update_travel_preference(travel_preference, @update_attrs)
      assert travel_preference.has_wheelchair == false
      assert travel_preference.homeairport_location == "some updated homeairport_location"
      assert travel_preference.labelname == "some updated labelname"
      assert travel_preference.mealtype_code == "some updated mealtype_code"
      assert travel_preference.preferred_aircraft_seat_type_code == "some updated preferred_aircraft_seat_type_code"
    end

    test "update_travel_preference/2 with invalid data returns error changeset" do
      travel_preference = travel_preference_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_travel_preference(travel_preference, @invalid_attrs)
      assert travel_preference == IndividualContext.get_travel_preference!(travel_preference.id)
    end

    test "delete_travel_preference/1 deletes the travel_preference" do
      travel_preference = travel_preference_fixture()
      assert {:ok, %TravelPreference{}} = IndividualContext.delete_travel_preference(travel_preference)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_travel_preference!(travel_preference.id) end
    end

    test "change_travel_preference/1 returns a travel_preference changeset" do
      travel_preference = travel_preference_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_travel_preference(travel_preference)
    end
  end

  describe "frequentflyercards" do
    alias Agento.IndividualContext.FrequentFlyerCard

    @valid_attrs %{airline_iata_code: "some airline_iata_code", airline_name: "some airline_name", frequent_flyer_number: "some frequent_flyer_number"}
    @update_attrs %{airline_iata_code: "some updated airline_iata_code", airline_name: "some updated airline_name", frequent_flyer_number: "some updated frequent_flyer_number"}
    @invalid_attrs %{airline_iata_code: nil, airline_name: nil, frequent_flyer_number: nil}

    def frequent_flyer_card_fixture(attrs \\ %{}) do
      {:ok, frequent_flyer_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_frequent_flyer_card()

      frequent_flyer_card
    end

    test "list_frequentflyercards/0 returns all frequentflyercards" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert IndividualContext.list_frequentflyercards() == [frequent_flyer_card]
    end

    test "get_frequent_flyer_card!/1 returns the frequent_flyer_card with given id" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert IndividualContext.get_frequent_flyer_card!(frequent_flyer_card.id) == frequent_flyer_card
    end

    test "create_frequent_flyer_card/1 with valid data creates a frequent_flyer_card" do
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = IndividualContext.create_frequent_flyer_card(@valid_attrs)
      assert frequent_flyer_card.airline_iata_code == "some airline_iata_code"
      assert frequent_flyer_card.airline_name == "some airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some frequent_flyer_number"
    end

    test "create_frequent_flyer_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_frequent_flyer_card(@invalid_attrs)
    end

    test "update_frequent_flyer_card/2 with valid data updates the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{} = frequent_flyer_card} = IndividualContext.update_frequent_flyer_card(frequent_flyer_card, @update_attrs)
      assert frequent_flyer_card.airline_iata_code == "some updated airline_iata_code"
      assert frequent_flyer_card.airline_name == "some updated airline_name"
      assert frequent_flyer_card.frequent_flyer_number == "some updated frequent_flyer_number"
    end

    test "update_frequent_flyer_card/2 with invalid data returns error changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_frequent_flyer_card(frequent_flyer_card, @invalid_attrs)
      assert frequent_flyer_card == IndividualContext.get_frequent_flyer_card!(frequent_flyer_card.id)
    end

    test "delete_frequent_flyer_card/1 deletes the frequent_flyer_card" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert {:ok, %FrequentFlyerCard{}} = IndividualContext.delete_frequent_flyer_card(frequent_flyer_card)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_frequent_flyer_card!(frequent_flyer_card.id) end
    end

    test "change_frequent_flyer_card/1 returns a frequent_flyer_card changeset" do
      frequent_flyer_card = frequent_flyer_card_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_frequent_flyer_card(frequent_flyer_card)
    end
  end

  describe "travelcards" do
    alias Agento.IndividualContext.TravelCard

    @valid_attrs %{expiration: ~N[2010-04-17 14:00:00], travelcardnumber: "some travelcardnumber"}
    @update_attrs %{expiration: ~N[2011-05-18 15:01:01], travelcardnumber: "some updated travelcardnumber"}
    @invalid_attrs %{expiration: nil, travelcardnumber: nil}

    def travel_card_fixture(attrs \\ %{}) do
      {:ok, travel_card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_travel_card()

      travel_card
    end

    test "list_travelcards/0 returns all travelcards" do
      travel_card = travel_card_fixture()
      assert IndividualContext.list_travelcards() == [travel_card]
    end

    test "get_travel_card!/1 returns the travel_card with given id" do
      travel_card = travel_card_fixture()
      assert IndividualContext.get_travel_card!(travel_card.id) == travel_card
    end

    test "create_travel_card/1 with valid data creates a travel_card" do
      assert {:ok, %TravelCard{} = travel_card} = IndividualContext.create_travel_card(@valid_attrs)
      assert travel_card.expiration == ~N[2010-04-17 14:00:00]
      assert travel_card.travelcardnumber == "some travelcardnumber"
    end

    test "create_travel_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_travel_card(@invalid_attrs)
    end

    test "update_travel_card/2 with valid data updates the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{} = travel_card} = IndividualContext.update_travel_card(travel_card, @update_attrs)
      assert travel_card.expiration == ~N[2011-05-18 15:01:01]
      assert travel_card.travelcardnumber == "some updated travelcardnumber"
    end

    test "update_travel_card/2 with invalid data returns error changeset" do
      travel_card = travel_card_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_travel_card(travel_card, @invalid_attrs)
      assert travel_card == IndividualContext.get_travel_card!(travel_card.id)
    end

    test "delete_travel_card/1 deletes the travel_card" do
      travel_card = travel_card_fixture()
      assert {:ok, %TravelCard{}} = IndividualContext.delete_travel_card(travel_card)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_travel_card!(travel_card.id) end
    end

    test "change_travel_card/1 returns a travel_card changeset" do
      travel_card = travel_card_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_travel_card(travel_card)
    end
  end

  describe "identification" do
    alias Agento.IndividualContext.Identifications

    @valid_attrs %{dateofissue: ~N[2010-04-17 14:00:00], document_number: "some document_number", expirationdate: ~N[2010-04-17 14:00:00], identificationtypecode: "some identificationtypecode", is_main_passport: true, issuing_authority: "some issuing_authority", place_of_issue: "some place_of_issue"}
    @update_attrs %{dateofissue: ~N[2011-05-18 15:01:01], document_number: "some updated document_number", expirationdate: ~N[2011-05-18 15:01:01], identificationtypecode: "some updated identificationtypecode", is_main_passport: false, issuing_authority: "some updated issuing_authority", place_of_issue: "some updated place_of_issue"}
    @invalid_attrs %{dateofissue: nil, document_number: nil, expirationdate: nil, identificationtypecode: nil, is_main_passport: nil, issuing_authority: nil, place_of_issue: nil}

    def identifications_fixture(attrs \\ %{}) do
      {:ok, identifications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_identifications()

      identifications
    end

    test "list_identification/0 returns all identification" do
      identifications = identifications_fixture()
      assert IndividualContext.list_identification() == [identifications]
    end

    test "get_identifications!/1 returns the identifications with given id" do
      identifications = identifications_fixture()
      assert IndividualContext.get_identifications!(identifications.id) == identifications
    end

    test "create_identifications/1 with valid data creates a identifications" do
      assert {:ok, %Identifications{} = identifications} = IndividualContext.create_identifications(@valid_attrs)
      assert identifications.dateofissue == ~N[2010-04-17 14:00:00]
      assert identifications.document_number == "some document_number"
      assert identifications.expirationdate == ~N[2010-04-17 14:00:00]
      assert identifications.identificationtypecode == "some identificationtypecode"
      assert identifications.is_main_passport == true
      assert identifications.issuing_authority == "some issuing_authority"
      assert identifications.place_of_issue == "some place_of_issue"
    end

    test "create_identifications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_identifications(@invalid_attrs)
    end

    test "update_identifications/2 with valid data updates the identifications" do
      identifications = identifications_fixture()
      assert {:ok, %Identifications{} = identifications} = IndividualContext.update_identifications(identifications, @update_attrs)
      assert identifications.dateofissue == ~N[2011-05-18 15:01:01]
      assert identifications.document_number == "some updated document_number"
      assert identifications.expirationdate == ~N[2011-05-18 15:01:01]
      assert identifications.identificationtypecode == "some updated identificationtypecode"
      assert identifications.is_main_passport == false
      assert identifications.issuing_authority == "some updated issuing_authority"
      assert identifications.place_of_issue == "some updated place_of_issue"
    end

    test "update_identifications/2 with invalid data returns error changeset" do
      identifications = identifications_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_identifications(identifications, @invalid_attrs)
      assert identifications == IndividualContext.get_identifications!(identifications.id)
    end

    test "delete_identifications/1 deletes the identifications" do
      identifications = identifications_fixture()
      assert {:ok, %Identifications{}} = IndividualContext.delete_identifications(identifications)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_identifications!(identifications.id) end
    end

    test "change_identifications/1 returns a identifications changeset" do
      identifications = identifications_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_identifications(identifications)
    end
  end
end
