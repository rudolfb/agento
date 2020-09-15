defmodule Agento.OrganisationAddressContextTest do
  use Agento.DataCase

  alias Agento.OrganisationAddressContext

  describe "organisations_addresses" do
    alias Agento.OrganisationAddressContext.OrganisationAddress

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def organisation_address_fixture(attrs \\ %{}) do
      {:ok, organisation_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationAddressContext.create_organisation_address()

      organisation_address
    end

    test "list_organisations_addresses/0 returns all organisations_addresses" do
      organisation_address = organisation_address_fixture()
      assert OrganisationAddressContext.list_organisations_addresses() == [organisation_address]
    end

    test "get_organisation_address!/1 returns the organisation_address with given id" do
      organisation_address = organisation_address_fixture()
      assert OrganisationAddressContext.get_organisation_address!(organisation_address.id) == organisation_address
    end

    test "create_organisation_address/1 with valid data creates a organisation_address" do
      assert {:ok, %OrganisationAddress{} = organisation_address} = OrganisationAddressContext.create_organisation_address(@valid_attrs)
    end

    test "create_organisation_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationAddressContext.create_organisation_address(@invalid_attrs)
    end

    test "update_organisation_address/2 with valid data updates the organisation_address" do
      organisation_address = organisation_address_fixture()
      assert {:ok, %OrganisationAddress{} = organisation_address} = OrganisationAddressContext.update_organisation_address(organisation_address, @update_attrs)
    end

    test "update_organisation_address/2 with invalid data returns error changeset" do
      organisation_address = organisation_address_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationAddressContext.update_organisation_address(organisation_address, @invalid_attrs)
      assert organisation_address == OrganisationAddressContext.get_organisation_address!(organisation_address.id)
    end

    test "delete_organisation_address/1 deletes the organisation_address" do
      organisation_address = organisation_address_fixture()
      assert {:ok, %OrganisationAddress{}} = OrganisationAddressContext.delete_organisation_address(organisation_address)
      assert_raise Ecto.NoResultsError, fn -> OrganisationAddressContext.get_organisation_address!(organisation_address.id) end
    end

    test "change_organisation_address/1 returns a organisation_address changeset" do
      organisation_address = organisation_address_fixture()
      assert %Ecto.Changeset{} = OrganisationAddressContext.change_organisation_address(organisation_address)
    end
  end
end
