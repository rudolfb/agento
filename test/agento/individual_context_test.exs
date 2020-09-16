defmodule Agento.IndividualContextTest do
  use Agento.DataCase

  alias Agento.IndividualContext

  describe "individuals" do
    alias Agento.IndividualContext.Individual

    @valid_attrs %{birthdate: ~D[2010-04-17], dateofdeath: ~D[2010-04-17], displayname: "some displayname", firstname: "some firstname", gender: "some gender", is_deleted: true, lastname: "some lastname", native_language_code: "some native_language_code"}
    @update_attrs %{birthdate: ~D[2011-05-18], dateofdeath: ~D[2011-05-18], displayname: "some updated displayname", firstname: "some updated firstname", gender: "some updated gender", is_deleted: false, lastname: "some updated lastname", native_language_code: "some updated native_language_code"}
    @invalid_attrs %{birthdate: nil, dateofdeath: nil, displayname: nil, firstname: nil, gender: nil, is_deleted: nil, lastname: nil, native_language_code: nil}

    def individual_fixture(attrs \\ %{}) do
      {:ok, individual} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IndividualContext.create_individual()

      individual
    end

    test "list_individuals/0 returns all individuals" do
      individual = individual_fixture()
      assert IndividualContext.list_individuals() == [individual]
    end

    test "get_individual!/1 returns the individual with given id" do
      individual = individual_fixture()
      assert IndividualContext.get_individual!(individual.id) == individual
    end

    test "create_individual/1 with valid data creates a individual" do
      assert {:ok, %Individual{} = individual} = IndividualContext.create_individual(@valid_attrs)
      assert individual.birthdate == ~D[2010-04-17]
      assert individual.dateofdeath == ~D[2010-04-17]
      assert individual.displayname == "some displayname"
      assert individual.firstname == "some firstname"
      assert individual.gender == "some gender"
      assert individual.is_deleted == true
      assert individual.lastname == "some lastname"
      assert individual.native_language_code == "some native_language_code"
    end

    test "create_individual/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IndividualContext.create_individual(@invalid_attrs)
    end

    test "update_individual/2 with valid data updates the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{} = individual} = IndividualContext.update_individual(individual, @update_attrs)
      assert individual.birthdate == ~D[2011-05-18]
      assert individual.dateofdeath == ~D[2011-05-18]
      assert individual.displayname == "some updated displayname"
      assert individual.firstname == "some updated firstname"
      assert individual.gender == "some updated gender"
      assert individual.is_deleted == false
      assert individual.lastname == "some updated lastname"
      assert individual.native_language_code == "some updated native_language_code"
    end

    test "update_individual/2 with invalid data returns error changeset" do
      individual = individual_fixture()
      assert {:error, %Ecto.Changeset{}} = IndividualContext.update_individual(individual, @invalid_attrs)
      assert individual == IndividualContext.get_individual!(individual.id)
    end

    test "delete_individual/1 deletes the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{}} = IndividualContext.delete_individual(individual)
      assert_raise Ecto.NoResultsError, fn -> IndividualContext.get_individual!(individual.id) end
    end

    test "change_individual/1 returns a individual changeset" do
      individual = individual_fixture()
      assert %Ecto.Changeset{} = IndividualContext.change_individual(individual)
    end
  end
end
