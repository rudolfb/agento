defmodule Agento.CountryTrans do
  use Ecto.Schema
  import Ecto.Changeset

  alias Agento.{Country}

  schema "countries_trans" do
    field :language
    field :name

    belongs_to :country, Country
  end

  def changeset(country, params) do
    country
    |> cast(params, [:language, :name])
    |> validate_required([:language, :name])
  end
end
