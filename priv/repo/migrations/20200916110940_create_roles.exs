defmodule Agento.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :begindate, :naive_datetime
      add :enddate, :naive_datetime
      add :individual_id, references(:individuals, on_delete: :nothing)
      add :organisation_id, references(:organisations, on_delete: :nothing)
      add :roletypecode_id, references(:roletypes, on_delete: :nothing)

      timestamps()
    end

    create index(:roles, [:individual_id])
    create index(:roles, [:organisation_id])
    create index(:roles, [:roletypecode_id])
  end
end
