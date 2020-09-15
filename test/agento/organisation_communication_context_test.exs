defmodule Agento.OrganisationCommunicationContextTest do
  use Agento.DataCase

  alias Agento.OrganisationCommunicationContext

  describe "organisations_communications" do
    alias Agento.OrganisationCommunicationContext.OrganisationCommunications

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def organisation_communications_fixture(attrs \\ %{}) do
      {:ok, organisation_communications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrganisationCommunicationContext.create_organisation_communications()

      organisation_communications
    end

    test "list_organisations_communications/0 returns all organisations_communications" do
      organisation_communications = organisation_communications_fixture()
      assert OrganisationCommunicationContext.list_organisations_communications() == [organisation_communications]
    end

    test "get_organisation_communications!/1 returns the organisation_communications with given id" do
      organisation_communications = organisation_communications_fixture()
      assert OrganisationCommunicationContext.get_organisation_communications!(organisation_communications.id) == organisation_communications
    end

    test "create_organisation_communications/1 with valid data creates a organisation_communications" do
      assert {:ok, %OrganisationCommunications{} = organisation_communications} = OrganisationCommunicationContext.create_organisation_communications(@valid_attrs)
    end

    test "create_organisation_communications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrganisationCommunicationContext.create_organisation_communications(@invalid_attrs)
    end

    test "update_organisation_communications/2 with valid data updates the organisation_communications" do
      organisation_communications = organisation_communications_fixture()
      assert {:ok, %OrganisationCommunications{} = organisation_communications} = OrganisationCommunicationContext.update_organisation_communications(organisation_communications, @update_attrs)
    end

    test "update_organisation_communications/2 with invalid data returns error changeset" do
      organisation_communications = organisation_communications_fixture()
      assert {:error, %Ecto.Changeset{}} = OrganisationCommunicationContext.update_organisation_communications(organisation_communications, @invalid_attrs)
      assert organisation_communications == OrganisationCommunicationContext.get_organisation_communications!(organisation_communications.id)
    end

    test "delete_organisation_communications/1 deletes the organisation_communications" do
      organisation_communications = organisation_communications_fixture()
      assert {:ok, %OrganisationCommunications{}} = OrganisationCommunicationContext.delete_organisation_communications(organisation_communications)
      assert_raise Ecto.NoResultsError, fn -> OrganisationCommunicationContext.get_organisation_communications!(organisation_communications.id) end
    end

    test "change_organisation_communications/1 returns a organisation_communications changeset" do
      organisation_communications = organisation_communications_fixture()
      assert %Ecto.Changeset{} = OrganisationCommunicationContext.change_organisation_communications(organisation_communications)
    end
  end
end
