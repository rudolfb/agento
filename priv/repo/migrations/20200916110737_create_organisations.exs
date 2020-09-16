defmodule Agento.Repo.Migrations.CreateOrganisations do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add :name, :string
      add :abbreviation, :string
      add :foundationdate, :date
      add :begindate, :naive_datetime
      add :description, :string
      add :enddate, :naive_datetime
      add :is_deleted, :boolean, default: false, null: false
      add :popularname, :string
      add :correspondancelanguage1_id, references(:languages, on_delete: :nothing)

      timestamps()
    end

    create index(:organisations, [:correspondancelanguage1_id])
  end
end
