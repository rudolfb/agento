defmodule Agento.Basedata.IdentificationTypeCodeContextTest do
  use Agento.DataCase

  alias Agento.Basedata.IdentificationTypeCodeContext

  describe "identificationtypecodes" do
    alias Agento.Basedata.IdentificationTypeCodeContext.IdentificationTypeCode

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def identification_type_code_fixture(attrs \\ %{}) do
      {:ok, identification_type_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IdentificationTypeCodeContext.create_identification_type_code()

      identification_type_code
    end

    test "list_identificationtypecodes/0 returns all identificationtypecodes" do
      identification_type_code = identification_type_code_fixture()
      assert IdentificationTypeCodeContext.list_identificationtypecodes() == [identification_type_code]
    end

    test "get_identification_type_code!/1 returns the identification_type_code with given id" do
      identification_type_code = identification_type_code_fixture()
      assert IdentificationTypeCodeContext.get_identification_type_code!(identification_type_code.id) == identification_type_code
    end

    test "create_identification_type_code/1 with valid data creates a identification_type_code" do
      assert {:ok, %IdentificationTypeCode{} = identification_type_code} = IdentificationTypeCodeContext.create_identification_type_code(@valid_attrs)
      assert identification_type_code.name == "some name"
    end

    test "create_identification_type_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IdentificationTypeCodeContext.create_identification_type_code(@invalid_attrs)
    end

    test "update_identification_type_code/2 with valid data updates the identification_type_code" do
      identification_type_code = identification_type_code_fixture()
      assert {:ok, %IdentificationTypeCode{} = identification_type_code} = IdentificationTypeCodeContext.update_identification_type_code(identification_type_code, @update_attrs)
      assert identification_type_code.name == "some updated name"
    end

    test "update_identification_type_code/2 with invalid data returns error changeset" do
      identification_type_code = identification_type_code_fixture()
      assert {:error, %Ecto.Changeset{}} = IdentificationTypeCodeContext.update_identification_type_code(identification_type_code, @invalid_attrs)
      assert identification_type_code == IdentificationTypeCodeContext.get_identification_type_code!(identification_type_code.id)
    end

    test "delete_identification_type_code/1 deletes the identification_type_code" do
      identification_type_code = identification_type_code_fixture()
      assert {:ok, %IdentificationTypeCode{}} = IdentificationTypeCodeContext.delete_identification_type_code(identification_type_code)
      assert_raise Ecto.NoResultsError, fn -> IdentificationTypeCodeContext.get_identification_type_code!(identification_type_code.id) end
    end

    test "change_identification_type_code/1 returns a identification_type_code changeset" do
      identification_type_code = identification_type_code_fixture()
      assert %Ecto.Changeset{} = IdentificationTypeCodeContext.change_identification_type_code(identification_type_code)
    end
  end
end
