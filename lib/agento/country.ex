defmodule Agento.Country do
  use Ecto.Schema
  import Ecto.Changeset

  alias Agento.{CountryTrans}

  schema "countries" do
    field :alpha2
    field :alpha3
    field :numeric3
    field :name
    has_many(:countries_trans, CountryTrans)
  end

  def changeset(country, params) do
    country
    |> cast(params, [:alpha2, :alpha3, :numeric3, :name])
    |> validate_required([])
  end
end
