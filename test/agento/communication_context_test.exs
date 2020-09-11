defmodule Agento.CommunicationContextTest do
  use Agento.DataCase

  alias Agento.CommunicationContext

  describe "communications" do
    alias Agento.CommunicationContext.Communication

    @valid_attrs %{typecode: "some typecode", value: "some value"}
    @update_attrs %{typecode: "some updated typecode", value: "some updated value"}
    @invalid_attrs %{typecode: nil, value: nil}

    def communication_fixture(attrs \\ %{}) do
      {:ok, communication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CommunicationContext.create_communication()

      communication
    end

    test "list_communications/0 returns all communications" do
      communication = communication_fixture()
      assert CommunicationContext.list_communications() == [communication]
    end

    test "get_communication!/1 returns the communication with given id" do
      communication = communication_fixture()
      assert CommunicationContext.get_communication!(communication.id) == communication
    end

    test "create_communication/1 with valid data creates a communication" do
      assert {:ok, %Communication{} = communication} = CommunicationContext.create_communication(@valid_attrs)
      assert communication.typecode == "some typecode"
      assert communication.value == "some value"
    end

    test "create_communication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CommunicationContext.create_communication(@invalid_attrs)
    end

    test "update_communication/2 with valid data updates the communication" do
      communication = communication_fixture()
      assert {:ok, %Communication{} = communication} = CommunicationContext.update_communication(communication, @update_attrs)
      assert communication.typecode == "some updated typecode"
      assert communication.value == "some updated value"
    end

    test "update_communication/2 with invalid data returns error changeset" do
      communication = communication_fixture()
      assert {:error, %Ecto.Changeset{}} = CommunicationContext.update_communication(communication, @invalid_attrs)
      assert communication == CommunicationContext.get_communication!(communication.id)
    end

    test "delete_communication/1 deletes the communication" do
      communication = communication_fixture()
      assert {:ok, %Communication{}} = CommunicationContext.delete_communication(communication)
      assert_raise Ecto.NoResultsError, fn -> CommunicationContext.get_communication!(communication.id) end
    end

    test "change_communication/1 returns a communication changeset" do
      communication = communication_fixture()
      assert %Ecto.Changeset{} = CommunicationContext.change_communication(communication)
    end
  end
end
