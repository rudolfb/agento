defmodule Agento.Country do
  use Ecto.Schema
  import Ecto.Changeset
  # alias MusicDB.{Artist, Album}
  # alias Agento.{Country}

  schema "countries" do
    field(:alpha2)
    field(:alpha3)
    field(:numeric3)
  end

  def changeset(country, params) do
    country
    |> cast(params, [:alpha2, :alpha3, :numeric3])
    |> validate_required([])
  end
end
