defmodule Agento.IndividualAddressContextTest do
  use Agento.DataCase

  alias Agento.IndividualAddressContext

  describe "individuals_addresses" do
    alias Agento.IndividualAddressContext.IndividualAddress

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def individual_address_fixture(attrs \\ %{}) do
      {:ok, individual_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualAddressContext.create_individual_address()

      individual_address
    end

    test "list_individuals_addresses/0 returns all individuals_addresses" do
      individual_address = individual_address_fixture()
      assert IndividualAddressContext.list_individuals_addresses() == [individual_address]
    end

    test "get_individual_address!/1 returns the individual_address with given id" do
      individual_address = individual_address_fixture()
      assert IndividualAddressContext.get_individual_address!(individual_address.id) == individual_address
    end

    test "create_individual_address/1 with valid data creates a individual_address" do
      assert {:ok, %IndividualAddress{} = individual_address} = IndividualAddressContext.create_individual_address(@valid_attrs)
    end

    test "create_individual_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualAddressContext.create_individual_address(@invalid_attrs)
    end

    test "update_individual_address/2 with valid data updates the individual_address" do
      individual_address = individual_address_fixture()
      assert {:ok, %IndividualAddress{} = individual_address} = IndividualAddressContext.update_individual_address(individual_address, @update_attrs)
    end

    test "update_individual_address/2 with invalid data returns error changeset" do
      individual_address = individual_address_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualAddressContext.update_individual_address(individual_address, @invalid_attrs)
      assert individual_address == IndividualAddressContext.get_individual_address!(individual_address.id)
    end

    test "delete_individual_address/1 deletes the individual_address" do
      individual_address = individual_address_fixture()
      assert {:ok, %IndividualAddress{}} = IndividualAddressContext.delete_individual_address(individual_address)
      assert_raise Ecto.NoResultsError, fn -> IndividualAddressContext.get_individual_address!(individual_address.id) end
    end

    test "change_individual_address/1 returns a individual_address changeset" do
      individual_address = individual_address_fixture()
      assert %Ecto.Changeset{} = IndividualAddressContext.change_individual_address(individual_address)
    end
  end
end
