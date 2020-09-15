defmodule Agento.IndividualIdentificationContextTest do
  use Agento.DataCase

  alias Agento.IndividualIdentificationContext

  describe "identification" do
    alias Agento.IndividualIdentificationContext.Identifications

    @valid_attrs %{dateofissue: ~N[2010-04-17 14:00:00], document_number: "some document_number", expirationdate: ~N[2010-04-17 14:00:00], identificationtypecode: "some identificationtypecode", is_main_passport: true, issuing_authority: "some issuing_authority", place_of_issue: "some place_of_issue"}
    @update_attrs %{dateofissue: ~N[2011-05-18 15:01:01], document_number: "some updated document_number", expirationdate: ~N[2011-05-18 15:01:01], identificationtypecode: "some updated identificationtypecode", is_main_passport: false, issuing_authority: "some updated issuing_authority", place_of_issue: "some updated place_of_issue"}
    @invalid_attrs %{dateofissue: nil, document_number: nil, expirationdate: nil, identificationtypecode: nil, is_main_passport: nil, issuing_authority: nil, place_of_issue: nil}

    def identifications_fixture(attrs \\ %{}) do
      {:ok, identifications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualIdentificationContext.create_identifications()

      identifications
    end

    test "list_identification/0 returns all identification" do
      identifications = identifications_fixture()
      assert IndividualIdentificationContext.list_identification() == [identifications]
    end

    test "get_identifications!/1 returns the identifications with given id" do
      identifications = identifications_fixture()
      assert IndividualIdentificationContext.get_identifications!(identifications.id) == identifications
    end

    test "create_identifications/1 with valid data creates a identifications" do
      assert {:ok, %Identifications{} = identifications} = IndividualIdentificationContext.create_identifications(@valid_attrs)
      assert identifications.dateofissue == ~N[2010-04-17 14:00:00]
      assert identifications.document_number == "some document_number"
      assert identifications.expirationdate == ~N[2010-04-17 14:00:00]
      assert identifications.identificationtypecode == "some identificationtypecode"
      assert identifications.is_main_passport == true
      assert identifications.issuing_authority == "some issuing_authority"
      assert identifications.place_of_issue == "some place_of_issue"
    end

    test "create_identifications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualIdentificationContext.create_identifications(@invalid_attrs)
    end

    test "update_identifications/2 with valid data updates the identifications" do
      identifications = identifications_fixture()
      assert {:ok, %Identifications{} = identifications} = IndividualIdentificationContext.update_identifications(identifications, @update_attrs)
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
      assert {:error, %Ecto.Changeset{}} = IndividualIdentificationContext.update_identifications(identifications, @invalid_attrs)
      assert identifications == IndividualIdentificationContext.get_identifications!(identifications.id)
    end

    test "delete_identifications/1 deletes the identifications" do
      identifications = identifications_fixture()
      assert {:ok, %Identifications{}} = IndividualIdentificationContext.delete_identifications(identifications)
      assert_raise Ecto.NoResultsError, fn -> IndividualIdentificationContext.get_identifications!(identifications.id) end
    end

    test "change_identifications/1 returns a identifications changeset" do
      identifications = identifications_fixture()
      assert %Ecto.Changeset{} = IndividualIdentificationContext.change_identifications(identifications)
    end
  end
end
