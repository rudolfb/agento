defmodule Agento.AddressContext.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :active, :boolean, default: false
    field :begindate, :naive_datetime
    field :city, :string
    field :enddate, :naive_datetime
    field :is_pobox, :boolean, default: false
    field :pobox, :string
    field :state, :string
    field :street1, :string
    field :street2, :string
    field :zipcode, :string
    field :country_id, :id
    field :addresstype_id, :id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street1, :street2, :city, :zipcode, :state, :pobox, :is_pobox, :begindate, :enddate, :active])
    |> validate_required([:street1, :street2, :city, :zipcode, :state, :pobox, :is_pobox, :begindate, :enddate, :active])
  end
end
