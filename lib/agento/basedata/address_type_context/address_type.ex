defmodule Agento.Basedata.AddressTypeContext.AddressType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresstypes" do
    field :code, :string

    timestamps()
  end

  @doc false
  def changeset(address_type, attrs) do
    address_type
    |> cast(attrs, [:code])
    |> validate_required([:code])
  end
end
