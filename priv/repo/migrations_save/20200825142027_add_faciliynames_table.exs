defmodule Agento.Repo.Migrations.AddFaciliynamesTable do
  use Ecto.Migration

  def change do
    create table(:facilitynames) do
      add :facilityname, :string
      timestamps()
    end
  end
end
