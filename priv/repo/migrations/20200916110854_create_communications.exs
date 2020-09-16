defmodule Agento.Repo.Migrations.CreateCommunications do
  use Ecto.Migration

  def change do
    create table(:communications) do
      add :value, :string
      add :typecode, :string
      add :communication_type_code_id, references(:communication_type_codes, on_delete: :nothing)
      add :individual_id, references(:individuals, on_delete: :nothing)
      add :organisation_id, references(:organisations, on_delete: :nothing)

      timestamps()
    end

    create index(:communications, [:communication_type_code_id])
    create index(:communications, [:individual_id])
    create index(:communications, [:organisation_id])
  end
end
