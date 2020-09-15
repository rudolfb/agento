defmodule Agento.Basedata.AirportContext.Airport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "airports" do
    field :airport, :string
    field :iata, :string
    field :icao, :string
    field :latitude, :float
    field :longitude, :float
    field :region_name, :string
    field :country_id, :id

    timestamps()
  end

  @doc false
  def changeset(airport, attrs) do
    airport
    |> cast(attrs, [:region_name, :iata, :icao, :airport, :latitude, :longitude])
    |> validate_required([:region_name, :iata, :icao, :airport, :latitude, :longitude])
  end
end
