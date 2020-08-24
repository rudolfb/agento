defmodule Agento.Repo.Migrations.AddEmployeesTable do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :userid, :string, null: false
      add :entrydate, :date
      add :jobtitle, :string
      add :leavedate, :date
      add :leavingreason, :string
      add :managerindividualid, references(:individuals, on_delete: :nothing), null: true
      add :individual_id, references(:individuals, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:employees, :userid, unique: true)
  end
end
