defmodule Agento.OrganisationAddressContext.OrganisationAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organisations_addresses" do
    field :organisation_id, :id
    field :address_id, :id

    timestamps()
  end

  @doc false
  def changeset(organisation_address, attrs) do
    organisation_address
    |> cast(attrs, [])
    |> validate_required([])
  end
end
