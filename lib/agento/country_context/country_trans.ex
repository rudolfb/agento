defmodule Agento.CountryContext.CountryTrans do
  use Ecto.Schema
  import Ecto.Changeset

  alias Agento.CountryContext.{Country}

  schema "countries_trans" do
    field :language
    field :name

    belongs_to :country, Country

    timestamps()
  end

  def changeset(country_trans, params) do
    country_trans
    |> cast(params, [:language, :name])
    |> validate_required([:language, :name])
  end
end
