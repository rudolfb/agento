defmodule Agento.IndividualCommunicationContext.IndividualCommunication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "individuals_communications" do
    field :individual_id, :id
    field :communication_id, :id

    timestamps()
  end

  @doc false
  def changeset(individual_communication, attrs) do
    individual_communication
    |> cast(attrs, [])
    |> validate_required([])
  end
end
