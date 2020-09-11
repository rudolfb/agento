defmodule Agento.Repo.Migrations.CreateIndividualsAddresses do
  use Ecto.Migration

  def change do
    create table(:individuals_addresses) do
      add :individual_id, references(:individuals, on_delete: :nothing)
      add :address_id, references(:addresses, on_delete: :nothing)

      timestamps()
    end

    create index(:individuals_addresses, [:individual_id])
    create index(:individuals_addresses, [:address_id])
  end
end
