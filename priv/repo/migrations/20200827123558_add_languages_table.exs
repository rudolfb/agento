defmodule Agento.Repo.Migrations.AddLanguagesTable do
  use Ecto.Migration

  def change do
    create table("languages") do
      add :language, :string, size: 5
      add :default, :boolean, null: false, default: false
      add :active, :boolean, null: false, default: false
    end

    create unique_index("languages", [:language])
  end
end
