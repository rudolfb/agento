defmodule Agento.TravelPreferenceContext.TravelCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "travelcards" do
    field :expiration, :naive_datetime
    field :travelcardnumber, :string
    field :travelcardtype, :id
    field :travelpreference_id, :id

    timestamps()
  end

  @doc false
  def changeset(travel_card, attrs) do
    travel_card
    |> cast(attrs, [:travelcardnumber, :expiration])
    |> validate_required([:travelcardnumber, :expiration])
  end
end
