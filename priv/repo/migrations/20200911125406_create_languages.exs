defmodule Agento.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add(:code3, :string)
      add(:bcode, :string)
      add(:tcode, :string)
      add(:code2, :string)
      add(:language_name, :string, null: false)
      add(:scope, :string)
      add(:type, :string)
      add(:macro_language_code, :string)
      add(:macro_language_name, :string)
      add(:is_child, :boolean, default: false, null: false)
      add(:is_correspondance_language, :boolean, default: false, null: false)
      add(:sort_order, :integer, default: 0, null: false)
      add(:is_correspondance_language_active, :boolean, default: false, null: false)
      add(:is_visible, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
