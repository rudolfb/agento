defmodule Agento.AddressContextTest do
  use Agento.DataCase

  alias Agento.AddressContext

  describe "addresses" do
    alias Agento.AddressContext.Address

    @valid_attrs %{active: true, begindate: ~N[2010-04-17 14:00:00], city: "some city", enddate: ~N[2010-04-17 14:00:00], is_pobox: true, pobox: "some pobox", state: "some state", street1: "some street1", street2: "some street2", zipcode: "some zipcode"}
    @update_attrs %{active: false, begindate: ~N[2011-05-18 15:01:01], city: "some updated city", enddate: ~N[2011-05-18 15:01:01], is_pobox: false, pobox: "some updated pobox", state: "some updated state", street1: "some updated street1", street2: "some updated street2", zipcode: "some updated zipcode"}
    @invalid_attrs %{active: nil, begindate: nil, city: nil, enddate: nil, is_pobox: nil, pobox: nil, state: nil, street1: nil, street2: nil, zipcode: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AddressContext.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert AddressContext.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert AddressContext.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = AddressContext.create_address(@valid_attrs)
      assert address.active == true
      assert address.begindate == ~N[2010-04-17 14:00:00]
      assert address.city == "some city"
      assert address.enddate == ~N[2010-04-17 14:00:00]
      assert address.is_pobox == true
      assert address.pobox == "some pobox"
      assert address.state == "some state"
      assert address.street1 == "some street1"
      assert address.street2 == "some street2"
      assert address.zipcode == "some zipcode"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AddressContext.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = AddressContext.update_address(address, @update_attrs)
      assert address.active == false
      assert address.begindate == ~N[2011-05-18 15:01:01]
      assert address.city == "some updated city"
      assert address.enddate == ~N[2011-05-18 15:01:01]
      assert address.is_pobox == false
      assert address.pobox == "some updated pobox"
      assert address.state == "some updated state"
      assert address.street1 == "some updated street1"
      assert address.street2 == "some updated street2"
      assert address.zipcode == "some updated zipcode"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = AddressContext.update_address(address, @invalid_attrs)
      assert address == AddressContext.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = AddressContext.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> AddressContext.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = AddressContext.change_address(address)
    end
  end
end
