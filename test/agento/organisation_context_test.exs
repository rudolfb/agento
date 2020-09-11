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

  describe "organisation_name_trans" do
    alias Agento.OrganisationContext.OrganisationNameTrans

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def organisation_name_trans_fixture(attrs \\ %{}) do
      {:ok, organisation_name_trans} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationContext.create_organisation_name_trans()

      organisation_name_trans
    end

    test "list_organisation_name_trans/0 returns all organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert OrganisationContext.list_organisation_name_trans() == [organisation_name_trans]
    end

    test "get_organisation_name_trans!/1 returns the organisation_name_trans with given id" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert OrganisationContext.get_organisation_name_trans!(organisation_name_trans.id) == organisation_name_trans
    end

    test "create_organisation_name_trans/1 with valid data creates a organisation_name_trans" do
      assert {:ok, %OrganisationNameTrans{} = organisation_name_trans} = OrganisationContext.create_organisation_name_trans(@valid_attrs)
      assert organisation_name_trans.name == "some name"
    end

    test "create_organisation_name_trans/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.create_organisation_name_trans(@invalid_attrs)
    end

    test "update_organisation_name_trans/2 with valid data updates the organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:ok, %OrganisationNameTrans{} = organisation_name_trans} = OrganisationContext.update_organisation_name_trans(organisation_name_trans, @update_attrs)
      assert organisation_name_trans.name == "some updated name"
    end

    test "update_organisation_name_trans/2 with invalid data returns error changeset" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.update_organisation_name_trans(organisation_name_trans, @invalid_attrs)
      assert organisation_name_trans == OrganisationContext.get_organisation_name_trans!(organisation_name_trans.id)
    end

    test "delete_organisation_name_trans/1 deletes the organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:ok, %OrganisationNameTrans{}} = OrganisationContext.delete_organisation_name_trans(organisation_name_trans)
      assert_raise Ecto.NoResultsError, fn -> OrganisationContext.get_organisation_name_trans!(organisation_name_trans.id) end
    end

    test "change_organisation_name_trans/1 returns a organisation_name_trans changeset" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert %Ecto.Changeset{} = OrganisationContext.change_organisation_name_trans(organisation_name_trans)
    end
  end

  describe "organisations_addresses" do
    alias Agento.OrganisationContext.OrganisationAddress

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def organisation_address_fixture(attrs \\ %{}) do
      {:ok, organisation_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationContext.create_organisation_address()

      organisation_address
    end

    test "list_organisations_addresses/0 returns all organisations_addresses" do
      organisation_address = organisation_address_fixture()
      assert OrganisationContext.list_organisations_addresses() == [organisation_address]
    end

    test "get_organisation_address!/1 returns the organisation_address with given id" do
      organisation_address = organisation_address_fixture()
      assert OrganisationContext.get_organisation_address!(organisation_address.id) == organisation_address
    end

    test "create_organisation_address/1 with valid data creates a organisation_address" do
      assert {:ok, %OrganisationAddress{} = organisation_address} = OrganisationContext.create_organisation_address(@valid_attrs)
    end

    test "create_organisation_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.create_organisation_address(@invalid_attrs)
    end

    test "update_organisation_address/2 with valid data updates the organisation_address" do
      organisation_address = organisation_address_fixture()
      assert {:ok, %OrganisationAddress{} = organisation_address} = OrganisationContext.update_organisation_address(organisation_address, @update_attrs)
    end

    test "update_organisation_address/2 with invalid data returns error changeset" do
      organisation_address = organisation_address_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.update_organisation_address(organisation_address, @invalid_attrs)
      assert organisation_address == OrganisationContext.get_organisation_address!(organisation_address.id)
    end

    test "delete_organisation_address/1 deletes the organisation_address" do
      organisation_address = organisation_address_fixture()
      assert {:ok, %OrganisationAddress{}} = OrganisationContext.delete_organisation_address(organisation_address)
      assert_raise Ecto.NoResultsError, fn -> OrganisationContext.get_organisation_address!(organisation_address.id) end
    end

    test "change_organisation_address/1 returns a organisation_address changeset" do
      organisation_address = organisation_address_fixture()
      assert %Ecto.Changeset{} = OrganisationContext.change_organisation_address(organisation_address)
    end
  end

  describe "organisations_communications" do
    alias Agento.OrganisationContext.OrganisationCommunications

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def organisation_communications_fixture(attrs \\ %{}) do
      {:ok, organisation_communications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationContext.create_organisation_communications()

      organisation_communications
    end

    test "list_organisations_communications/0 returns all organisations_communications" do
      organisation_communications = organisation_communications_fixture()
      assert OrganisationContext.list_organisations_communications() == [organisation_communications]
    end

    test "get_organisation_communications!/1 returns the organisation_communications with given id" do
      organisation_communications = organisation_communications_fixture()
      assert OrganisationContext.get_organisation_communications!(organisation_communications.id) == organisation_communications
    end

    test "create_organisation_communications/1 with valid data creates a organisation_communications" do
      assert {:ok, %OrganisationCommunications{} = organisation_communications} = OrganisationContext.create_organisation_communications(@valid_attrs)
    end

    test "create_organisation_communications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.create_organisation_communications(@invalid_attrs)
    end

    test "update_organisation_communications/2 with valid data updates the organisation_communications" do
      organisation_communications = organisation_communications_fixture()
      assert {:ok, %OrganisationCommunications{} = organisation_communications} = OrganisationContext.update_organisation_communications(organisation_communications, @update_attrs)
    end

    test "update_organisation_communications/2 with invalid data returns error changeset" do
      organisation_communications = organisation_communications_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationContext.update_organisation_communications(organisation_communications, @invalid_attrs)
      assert organisation_communications == OrganisationContext.get_organisation_communications!(organisation_communications.id)
    end

    test "delete_organisation_communications/1 deletes the organisation_communications" do
      organisation_communications = organisation_communications_fixture()
      assert {:ok, %OrganisationCommunications{}} = OrganisationContext.delete_organisation_communications(organisation_communications)
      assert_raise Ecto.NoResultsError, fn -> OrganisationContext.get_organisation_communications!(organisation_communications.id) end
    end

    test "change_organisation_communications/1 returns a organisation_communications changeset" do
      organisation_communications = organisation_communications_fixture()
      assert %Ecto.Changeset{} = OrganisationContext.change_organisation_communications(organisation_communications)
    end
  end
end
