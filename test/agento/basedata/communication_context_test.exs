defmodule Agento.Basedata.CommunicationContextTest do
  use Agento.DataCase

  alias Agento.Basedata.CommunicationContext

  describe "communication_type_codes" do
    alias Agento.Basedata.CommunicationContext.CommunicationTypeCode

    @valid_attrs %{code: "some code"}
    @update_attrs %{code: "some updated code"}
    @invalid_attrs %{code: nil}

    def communication_type_code_fixture(attrs \\ %{}) do
      {:ok, communication_type_code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CommunicationContext.create_communication_type_code()

      communication_type_code
    end

    test "list_communication_type_codes/0 returns all communication_type_codes" do
      communication_type_code = communication_type_code_fixture()
      assert CommunicationContext.list_communication_type_codes() == [communication_type_code]
    end

    test "get_communication_type_code!/1 returns the communication_type_code with given id" do
      communication_type_code = communication_type_code_fixture()
      assert CommunicationContext.get_communication_type_code!(communication_type_code.id) == communication_type_code
    end

    test "create_communication_type_code/1 with valid data creates a communication_type_code" do
      assert {:ok, %CommunicationTypeCode{} = communication_type_code} = CommunicationContext.create_communication_type_code(@valid_attrs)
      assert communication_type_code.code == "some code"
    end

    test "create_communication_type_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CommunicationContext.create_communication_type_code(@invalid_attrs)
    end

    test "update_communication_type_code/2 with valid data updates the communication_type_code" do
      communication_type_code = communication_type_code_fixture()
      assert {:ok, %CommunicationTypeCode{} = communication_type_code} = CommunicationContext.update_communication_type_code(communication_type_code, @update_attrs)
      assert communication_type_code.code == "some updated code"
    end

    test "update_communication_type_code/2 with invalid data returns error changeset" do
      communication_type_code = communication_type_code_fixture()
      assert {:error, %Ecto.Changeset{}} = CommunicationContext.update_communication_type_code(communication_type_code, @invalid_attrs)
      assert communication_type_code == CommunicationContext.get_communication_type_code!(communication_type_code.id)
    end

    test "delete_communication_type_code/1 deletes the communication_type_code" do
      communication_type_code = communication_type_code_fixture()
      assert {:ok, %CommunicationTypeCode{}} = CommunicationContext.delete_communication_type_code(communication_type_code)
      assert_raise Ecto.NoResultsError, fn -> CommunicationContext.get_communication_type_code!(communication_type_code.id) end
    end

    test "change_communication_type_code/1 returns a communication_type_code changeset" do
      communication_type_code = communication_type_code_fixture()
      assert %Ecto.Changeset{} = CommunicationContext.change_communication_type_code(communication_type_code)
    end
  end
end
