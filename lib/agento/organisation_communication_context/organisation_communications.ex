defmodule Agento.OrganisationCommunicationContext.OrganisationCommunications do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organisations_communications" do
    field :organisation_id, :id
    field :communication_id, :id

    timestamps()
  end

  @doc false
  def changeset(organisation_communications, attrs) do
    organisation_communications
    |> cast(attrs, [])
    |> validate_required([])
  end
end
