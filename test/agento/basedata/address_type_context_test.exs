defmodule Agento.Basedata.AddressTypeContextTest do
  use Agento.DataCase

  alias Agento.Basedata.AddressTypeContext

  describe "addresstypes" do
    alias Agento.Basedata.AddressTypeContext.AddressType

    @valid_attrs %{code: "some code"}
    @update_attrs %{code: "some updated code"}
    @invalid_attrs %{code: nil}

    def address_type_fixture(attrs \\ %{}) do
      {:ok, address_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AddressTypeContext.create_address_type()

      address_type
    end

    test "list_addresstypes/0 returns all addresstypes" do
      address_type = address_type_fixture()
      assert AddressTypeContext.list_addresstypes() == [address_type]
    end

    test "get_address_type!/1 returns the address_type with given id" do
      address_type = address_type_fixture()
      assert AddressTypeContext.get_address_type!(address_type.id) == address_type
    end

    test "create_address_type/1 with valid data creates a address_type" do
      assert {:ok, %AddressType{} = address_type} = AddressTypeContext.create_address_type(@valid_attrs)
      assert address_type.code == "some code"
    end

    test "create_address_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AddressTypeContext.create_address_type(@invalid_attrs)
    end

    test "update_address_type/2 with valid data updates the address_type" do
      address_type = address_type_fixture()
      assert {:ok, %AddressType{} = address_type} = AddressTypeContext.update_address_type(address_type, @update_attrs)
      assert address_type.code == "some updated code"
    end

    test "update_address_type/2 with invalid data returns error changeset" do
      address_type = address_type_fixture()
      assert {:error, %Ecto.Changeset{}} = AddressTypeContext.update_address_type(address_type, @invalid_attrs)
      assert address_type == AddressTypeContext.get_address_type!(address_type.id)
    end

    test "delete_address_type/1 deletes the address_type" do
      address_type = address_type_fixture()
      assert {:ok, %AddressType{}} = AddressTypeContext.delete_address_type(address_type)
      assert_raise Ecto.NoResultsError, fn -> AddressTypeContext.get_address_type!(address_type.id) end
    end

    test "change_address_type/1 returns a address_type changeset" do
      address_type = address_type_fixture()
      assert %Ecto.Changeset{} = AddressTypeContext.change_address_type(address_type)
    end
  end
end
