defmodule Agento.RoleContext.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :begindate, :naive_datetime
    field :enddate, :naive_datetime
    field :individual_id, :id
    field :organisation_id, :id
    field :roletypecode_id, :id

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:begindate, :enddate])
    |> validate_required([:begindate, :enddate])
  end
end
