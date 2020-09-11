defmodule Agento.IndividualContext.FrequentFlyerCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "frequentflyercards" do
    field :airline_iata_code, :string
    field :airline_name, :string
    field :frequent_flyer_number, :string
    field :travelpreference_id, :id

    timestamps()
  end

  @doc false
  def changeset(frequent_flyer_card, attrs) do
    frequent_flyer_card
    |> cast(attrs, [:airline_name, :airline_iata_code, :frequent_flyer_number])
    |> validate_required([:airline_name, :airline_iata_code, :frequent_flyer_number])
  end
end
