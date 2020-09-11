defmodule Agento.IndividualContext.TravelPreference do
  use Ecto.Schema
  import Ecto.Changeset

  schema "travelpreferences" do
    field :has_wheelchair, :boolean, default: false
    field :homeairport_location, :string
    field :labelname, :string
    field :mealtype_code, :string
    field :preferred_aircraft_seat_type_code, :string
    field :individual_id, :id

    timestamps()
  end

  @doc false
  def changeset(travel_preference, attrs) do
    travel_preference
    |> cast(attrs, [:has_wheelchair, :homeairport_location, :labelname, :mealtype_code, :preferred_aircraft_seat_type_code])
    |> validate_required([:has_wheelchair, :homeairport_location, :labelname, :mealtype_code, :preferred_aircraft_seat_type_code])
  end
end
