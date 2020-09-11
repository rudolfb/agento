defmodule Agento.OrganisationContext.OrganisationNameTrans do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organisation_name_trans" do
    field :name, :string
    field :language, :id
    field :organisation_id, :id

    timestamps()
  end

  @doc false
  def changeset(organisation_name_trans, attrs) do
    organisation_name_trans
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
