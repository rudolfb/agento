defmodule Agento.OrganisationNameTransContextTest do
  use Agento.DataCase

  alias Agento.OrganisationNameTransContext

  describe "organisation_name_trans" do
    alias Agento.OrganisationNameTransContext.OrganisationNameTrans

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def organisation_name_trans_fixture(attrs \\ %{}) do
      {:ok, organisation_name_trans} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationNameTransContext.create_organisation_name_trans()

      organisation_name_trans
    end

    test "list_organisation_name_trans/0 returns all organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert OrganisationNameTransContext.list_organisation_name_trans() == [organisation_name_trans]
    end

    test "get_organisation_name_trans!/1 returns the organisation_name_trans with given id" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert OrganisationNameTransContext.get_organisation_name_trans!(organisation_name_trans.id) == organisation_name_trans
    end

    test "create_organisation_name_trans/1 with valid data creates a organisation_name_trans" do
      assert {:ok, %OrganisationNameTrans{} = organisation_name_trans} = OrganisationNameTransContext.create_organisation_name_trans(@valid_attrs)
      assert organisation_name_trans.name == "some name"
    end

    test "create_organisation_name_trans/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationNameTransContext.create_organisation_name_trans(@invalid_attrs)
    end

    test "update_organisation_name_trans/2 with valid data updates the organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:ok, %OrganisationNameTrans{} = organisation_name_trans} = OrganisationNameTransContext.update_organisation_name_trans(organisation_name_trans, @update_attrs)
      assert organisation_name_trans.name == "some updated name"
    end

    test "update_organisation_name_trans/2 with invalid data returns error changeset" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationNameTransContext.update_organisation_name_trans(organisation_name_trans, @invalid_attrs)
      assert organisation_name_trans == OrganisationNameTransContext.get_organisation_name_trans!(organisation_name_trans.id)
    end

    test "delete_organisation_name_trans/1 deletes the organisation_name_trans" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert {:ok, %OrganisationNameTrans{}} = OrganisationNameTransContext.delete_organisation_name_trans(organisation_name_trans)
      assert_raise Ecto.NoResultsError, fn -> OrganisationNameTransContext.get_organisation_name_trans!(organisation_name_trans.id) end
    end

    test "change_organisation_name_trans/1 returns a organisation_name_trans changeset" do
      organisation_name_trans = organisation_name_trans_fixture()
      assert %Ecto.Changeset{} = OrganisationNameTransContext.change_organisation_name_trans(organisation_name_trans)
    end
  end
end
