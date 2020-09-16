defmodule Agento.IdentificationContext.Identifications do
  use Ecto.Schema
  import Ecto.Changeset

  schema "identification" do
    field :dateofissue, :naive_datetime
    field :document_number, :string
    field :expirationdate, :naive_datetime
    field :identificationtypecode, :string
    field :is_main_passport, :boolean, default: false
    field :issuing_authority, :string
    field :place_of_issue, :string
    field :country_of_issue_id, :id
    field :document_country_code_id, :id
    field :individual_id, :id

    timestamps()
  end

  @doc false
  def changeset(identifications, attrs) do
    identifications
    |> cast(attrs, [:dateofissue, :document_number, :expirationdate, :identificationtypecode, :is_main_passport, :issuing_authority, :place_of_issue])
    |> validate_required([:dateofissue, :document_number, :expirationdate, :identificationtypecode, :is_main_passport, :issuing_authority, :place_of_issue])
  end
end
