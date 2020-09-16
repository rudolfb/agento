defmodule Agento.OrganisationContextTest do
  use Agento.DataCase

  alias Agento.OrganisationContext

  describe "organisations" do
    alias Agento.OrganisationContext.Organisation

    @valid_attrs %{abbreviation: "some abbreviation", begindate: ~N[2010-04-17 14:00:00], description: "some description", enddate: ~N[2010-04-17 14:00:00], foundationdate: ~D[2010-04-17], is_deleted: true, name: "some name", popularname: "some popularname"}
    @update_attrs %{abbreviation: "some updated abbreviation", begindate: ~N[2011-05-18 15:01:01], description: "some updated description", enddate: ~N[2011-05-18 15:01:01], foundationdate: ~D[2011-05-18], is_deleted: false, name: "some updated name", popularname: "some updated popularname"}
    @invalid_attrs %{abbreviation: nil, begindate: nil, description: nil, enddate: nil, foundationdate: nil, is_deleted: nil, name: nil, popularname: nil}

    def organisation_fixture(attrs \\ %{}) do
      {:ok, organisation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationContext.create_organisation()

      organisation
    end

    test "list_organisations/0 returns all organisations" do
      organisation = organisation_fixture()
      assert OrganisationContext.list_organisations() == [organisation]
    end

    test "get_organisation!/1 returns the organisation with given id" do
      organisation = organisation_fixture()
      assert OrganisationContext.get_organisation!(organisation.id) == organisation
    end

    test "create_organisation/1 with valid data creates a organisation" do
      assert {:ok, %Organisation{} = organisation} = OrganisationContext.create_organisation(@valid_attrs)
      assert organisation.abbreviation == "some abbreviation"
      assert organisation.begindate == ~N[2010-04-17 14:00:00]
      assert organisation.description == "some description"
      assert organisation.enddate == ~N[2010-04-17 14:00:00]
      assert organisation.foundationdate == ~D[2010-04-17]
      assert organisation.is_deleted == true
      assert organisation.name == "some name"
      assert organisation.popularname == "some popularname"
    end

    test "create_organisation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.create_organisation(@invalid_attrs)
    end

    test "update_organisation/2 with valid data updates the organisation" do
      organisation = organisation_fixture()
      assert {:ok, %Organisation{} = organisation} = OrganisationContext.update_organisation(organisation, @update_attrs)
      assert organisation.abbreviation == "some updated abbreviation"
      assert organisation.begindate == ~N[2011-05-18 15:01:01]
      assert organisation.description == "some updated description"
      assert organisation.enddate == ~N[2011-05-18 15:01:01]
      assert organisation.foundationdate == ~D[2011-05-18]
      assert organisation.is_deleted == false
      assert organisation.name == "some updated name"
      assert organisation.popularname == "some updated popularname"
    end

    test "update_organisation/2 with invalid data returns error changeset" do
      organisation = organisation_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.update_organisation(organisation, @invalid_attrs)
      assert organisation == OrganisationContext.get_organisation!(organisation.id)
    end

    test "delete_organisation/1 deletes the organisation" do
      organisation = organisation_fixture()
      assert {:ok, %Organisation{}} = OrganisationContext.delete_organisation(organisation)
      assert_raise Ecto.NoResultsError, fn -> OrganisationContext.get_organisation!(organisation.id) end
    end

    test "change_organisation/1 returns a organisation changeset" do
      organisation = organisation_fixture()
      assert %Ecto.Changeset{} = OrganisationContext.change_organisation(organisation)
    end
  end
end
