defmodule Agento.Repo.Migrations.CreateOrganisationsAddresses do
  use Ecto.Migration

  def change do
    create table(:organisations_addresses) do
      add :organisation_id, references(:organisations, on_delete: :nothing)
      add :address_id, references(:addresses, on_delete: :nothing)

      timestamps()
    end

    create index(:organisations_addresses, [:organisation_id])
    create index(:organisations_addresses, [:address_id])
  end
end
