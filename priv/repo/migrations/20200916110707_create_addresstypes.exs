defmodule Agento.Repo.Migrations.CreateAddresstypes do
  use Ecto.Migration

  def change do
    create table(:addresstypes) do
      add :code, :string

      timestamps()
    end

  end
end
