defmodule Agento.Basedata.LanguageContext.Language do
  use Ecto.Schema
  import Ecto.Changeset

  schema "languages" do
    field :bcode, :string
    field :code2, :string
    field :code3, :string
    field :is_child, :boolean, default: false
    field :is_correspondance_language, :boolean, default: false
    field :is_correspondance_language_active, :boolean, default: false
    field :is_visible, :boolean, default: false
    field :language_name, :string
    field :macro_language_code, :string
    field :macro_language_name, :string
    field :scope, :string
    field :sort_order, :integer
    field :tcode, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:code3, :bcode, :tcode, :code2, :language_name, :scope, :type, :macro_language_code, :macro_language_name, :is_child, :is_correspondance_language, :sort_order, :is_correspondance_language_active, :is_visible])
    |> validate_required([:code3, :bcode, :tcode, :code2, :language_name, :scope, :type, :macro_language_code, :macro_language_name, :is_child, :is_correspondance_language, :sort_order, :is_correspondance_language_active, :is_visible])
  end
end
