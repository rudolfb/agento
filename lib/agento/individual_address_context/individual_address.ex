defmodule Agento.IndividualAddressContext.IndividualAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "individuals_addresses" do
    field :individual_id, :id
    field :address_id, :id

    timestamps()
  end

  @doc false
  def changeset(individual_address, attrs) do
    individual_address
    |> cast(attrs, [])
    |> validate_required([])
  end
end
