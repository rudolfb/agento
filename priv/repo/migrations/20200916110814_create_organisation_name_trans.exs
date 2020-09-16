defmodule Agento.Repo.Migrations.CreateOrganisationNameTrans do
  use Ecto.Migration

  def change do
    create table(:organisation_name_trans) do
      add :name, :string
      add :language, references(:languages, on_delete: :nothing)
      add :organisation_id, references(:organisations, on_delete: :nothing)

      timestamps()
    end

    create index(:organisation_name_trans, [:language])
    create index(:organisation_name_trans, [:organisation_id])
  end
end
