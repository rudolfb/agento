defmodule Agento.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :language, :string
    field :default, :boolean, default: false
  end

  def changeset(language, params) do
    language
    |> cast(params, [:language, :default])
    |> validate_required([:language, :default])
    |> unique_constraint(:language)
  end
end
