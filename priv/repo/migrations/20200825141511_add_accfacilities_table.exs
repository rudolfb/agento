defmodule Agento.Repo.Migrations.AddAccfacilitiesTable do
  use Ecto.Migration

  def change do
    create table(:accfacilities) do
      add :hotel_id, references(:hotels, on_delete: :nothing), null: false
      add :faciliygroup_id, references(:faciliygroups, on_delete: :nothing), null: false
      add :faciliyname_id, references(:faciliynames, on_delete: :nothing), null: false

      timestamps()
    end
  end
end
