defmodule Agento.Basedata.CountryContext.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :alpha2, :string
    field :alpha3, :string
    field :name, :string
    field :numeric3, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:alpha2, :alpha3, :numeric3, :name])
    |> validate_required([:alpha2, :alpha3, :numeric3, :name])
  end
end
