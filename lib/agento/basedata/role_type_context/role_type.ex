defmodule Agento.Basedata.RoleTypeContext.RoleType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roletypes" do
    field :code, :string

    timestamps()
  end

  @doc false
  def changeset(role_type, attrs) do
    role_type
    |> cast(attrs, [:code])
    |> validate_required([:code])
  end
end
