defmodule Agento.Repo.Migrations.AddIndividualsAddressesTable do
  use Ecto.Migration

  def change do
    create table(:individuals_addresses) do
      add :individual_id, references(:individuals), null: false
      add :adresses_id, references(:individuals), null: false

      timestamps()
    end
  end
end
