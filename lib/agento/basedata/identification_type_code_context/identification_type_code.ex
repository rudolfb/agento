defmodule Agento.Basedata.IdentificationTypeCodeContext.IdentificationTypeCode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "identificationtypecodes" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(identification_type_code, attrs) do
    identification_type_code
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
