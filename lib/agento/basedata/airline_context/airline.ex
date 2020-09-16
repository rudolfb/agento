defmodule Agento.Basedata.AirlineContext.Airline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "airlines" do
    field :active, :boolean, default: false
    field :alias, :string
    field :callsign, :string
    field :country_name, :string
    field :iata, :string
    field :icao, :string
    field :id_nr, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(airline, attrs) do
    airline
    |> cast(attrs, [:id_nr, :name, :alias, :iata, :icao, :callsign, :country_name, :active])
    |> validate_required([:id_nr, :name, :alias, :iata, :icao, :callsign, :country_name, :active])
  end
end
