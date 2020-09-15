defmodule Agento.IndividualCommunicationContextTest do
  use Agento.DataCase

  alias Agento.IndividualCommunicationContext

  describe "individuals_communications" do
    alias Agento.IndividualCommunicationContext.IndividualCommunication

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def individual_communication_fixture(attrs \\ %{}) do
      {:ok, individual_communication} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualCommunicationContext.create_individual_communication()

      individual_communication
    end

    test "list_individuals_communications/0 returns all individuals_communications" do
      individual_communication = individual_communication_fixture()
      assert IndividualCommunicationContext.list_individuals_communications() == [individual_communication]
    end

    test "get_individual_communication!/1 returns the individual_communication with given id" do
      individual_communication = individual_communication_fixture()
      assert IndividualCommunicationContext.get_individual_communication!(individual_communication.id) == individual_communication
    end

    test "create_individual_communication/1 with valid data creates a individual_communication" do
      assert {:ok, %IndividualCommunication{} = individual_communication} = IndividualCommunicationContext.create_individual_communication(@valid_attrs)
    end

    test "create_individual_communication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualCommunicationContext.create_individual_communication(@invalid_attrs)
    end

    test "update_individual_communication/2 with valid data updates the individual_communication" do
      individual_communication = individual_communication_fixture()
      assert {:ok, %IndividualCommunication{} = individual_communication} = IndividualCommunicationContext.update_individual_communication(individual_communication, @update_attrs)
    end

    test "update_individual_communication/2 with invalid data returns error changeset" do
      individual_communication = individual_communication_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualCommunicationContext.update_individual_communication(individual_communication, @invalid_attrs)
      assert individual_communication == IndividualCommunicationContext.get_individual_communication!(individual_communication.id)
    end

    test "delete_individual_communication/1 deletes the individual_communication" do
      individual_communication = individual_communication_fixture()
      assert {:ok, %IndividualCommunication{}} = IndividualCommunicationContext.delete_individual_communication(individual_communication)
      assert_raise Ecto.NoResultsError, fn -> IndividualCommunicationContext.get_individual_communication!(individual_communication.id) end
    end

    test "change_individual_communication/1 returns a individual_communication changeset" do
      individual_communication = individual_communication_fixture()
      assert %Ecto.Changeset{} = IndividualCommunicationContext.change_individual_communication(individual_communication)
    end
  end
end
