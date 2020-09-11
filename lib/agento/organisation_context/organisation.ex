defmodule Agento.OrganisationContext.Organisation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organisations" do
    field :abbreviation, :string
    field :begindate, :naive_datetime
    field :description, :string
    field :enddate, :naive_datetime
    field :foundationdate, :date
    field :is_deleted, :boolean, default: false
    field :name, :string
    field :popularname, :string
    field :correspondancelanguage1_id, :id

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:name, :abbreviation, :foundationdate, :begindate, :description, :enddate, :is_deleted, :popularname])
    |> validate_required([:name, :abbreviation, :foundationdate, :begindate, :description, :enddate, :is_deleted, :popularname])
  end
end
