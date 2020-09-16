defmodule Agento.Repo.Migrations.CreateIdentificationtypecodes do
  use Ecto.Migration

  def change do
    create table(:identificationtypecodes) do
      add :name, :string

      timestamps()
    end

  end
end
