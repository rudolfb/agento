defmodule Agento.Repo.Migrations.CreateCommunications do
  use Ecto.Migration

  def change do
    create table(:communications) do
      add :value, :string
      add :typecode, :string
      add :communication_type_code_id, references(:communication_type_codes, on_delete: :nothing)

      timestamps()
    end

    create index(:communications, [:communication_type_code_id])
  end
end
