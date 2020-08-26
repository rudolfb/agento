defmodule Agento.Repo.Migrations.AddCountrystatesTable do
  use Ecto.Migration

  # The state names ought to be translatable

  def change do
    create table(:countrystates) do
      add :country_id, references(:countries, on_delete: :nothing), null: false
      add :statecode, :string, null: false
      add :statename, :string, null: false
      timestamps()
    end
  end
end
