defmodule Agento.Basedata.CommunicationTypeContext.CommunicationTypeCode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "communication_type_codes" do
    field :code, :string

    timestamps()
  end

  @doc false
  def changeset(communication_type_code, attrs) do
    communication_type_code
    |> cast(attrs, [:code])
    |> validate_required([:code])
  end
end
