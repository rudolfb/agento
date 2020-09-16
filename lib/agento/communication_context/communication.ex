defmodule Agento.CommunicationContext.Communication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "communications" do
    field :typecode, :string
    field :value, :string
    field :communication_type_code_id, :id
    field :individual_id, :id
    field :organisation_id, :id

    timestamps()
  end

  @doc false
  def changeset(communication, attrs) do
    communication
    |> cast(attrs, [:value, :typecode])
    |> validate_required([:value, :typecode])
  end
end
