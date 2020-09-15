defmodule Agento.Basedata.AddressContextTest do
  use Agento.DataCase

  alias Agento.Basedata.AddressContext

  describe "addresstypes" do
    alias Agento.Basedata.AddressContext.AddressType

    @valid_attrs %{code: "some code"}
    @update_attrs %{code: "some updated code"}
    @invalid_attrs %{code: nil}

    def address_type_fixture(attrs \\ %{}) do
      {:ok, address_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AddressContext.create_address_type()

      address_type
    end

    test "list_addresstypes/0 returns all addresstypes" do
      address_type = address_type_fixture()
      assert AddressContext.list_addresstypes() == [address_type]
    end

    test "get_address_type!/1 returns the address_type with given id" do
      address_type = address_type_fixture()
      assert AddressContext.get_address_type!(address_type.id) == address_type
    end

    test "create_address_type/1 with valid data creates a address_type" do
      assert {:ok, %AddressType{} = address_type} = AddressContext.create_address_type(@valid_attrs)
      assert address_type.code == "some code"
    end

    test "create_address_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AddressContext.create_address_type(@invalid_attrs)
    end

    test "update_address_type/2 with valid data updates the address_type" do
      address_type = address_type_fixture()
      assert {:ok, %AddressType{} = address_type} = AddressContext.update_address_type(address_type, @update_attrs)
      assert address_type.code == "some updated code"
    end

    test "update_address_type/2 with invalid data returns error changeset" do
      address_type = address_type_fixture()
      assert {:error, %Ecto.Changeset{}} = AddressContext.update_address_type(address_type, @invalid_attrs)
      assert address_type == AddressContext.get_address_type!(address_type.id)
    end

    test "delete_address_type/1 deletes the address_type" do
      address_type = address_type_fixture()
      assert {:ok, %AddressType{}} = AddressContext.delete_address_type(address_type)
      assert_raise Ecto.NoResultsError, fn -> AddressContext.get_address_type!(address_type.id) end
    end

    test "change_address_type/1 returns a address_type changeset" do
      address_type = address_type_fixture()
      assert %Ecto.Changeset{} = AddressContext.change_address_type(address_type)
    end
  end
end
