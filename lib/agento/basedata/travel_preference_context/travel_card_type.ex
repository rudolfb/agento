defmodule Agento.Basedata.TravelPreferenceContext.TravelCardType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "travelcardtypes" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(travel_card_type, attrs) do
    travel_card_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
