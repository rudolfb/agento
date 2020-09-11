defmodule Agento.Repo.Migrations.CreateOrganisationsCommunications do
  use Ecto.Migration

  def change do
    create table(:organisations_communications) do
      add :organisation_id, references(:organisations, on_delete: :nothing)
      add :communication_id, references(:communications, on_delete: :nothing)

      timestamps()
    end

    create index(:organisations_communications, [:organisation_id])
    create index(:organisations_communications, [:communication_id])
  end
end
