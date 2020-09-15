defmodule Agento.Repo.Migrations.CreateIndividualsCommunications do
  use Ecto.Migration

  def change do
    create table(:individuals_communications) do
      add :individual_id, references(:individuals, on_delete: :nothing)
      add :communication_id, references(:communications, on_delete: :nothing)

      timestamps()
    end

    create index(:individuals_communications, [:individual_id])
    create index(:individuals_communications, [:communication_id])
  end
end
