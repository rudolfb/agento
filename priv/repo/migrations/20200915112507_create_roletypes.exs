defmodule Agento.Repo.Migrations.CreateRoletypes do
  use Ecto.Migration

  def change do
    create table(:roletypes) do
      add :code, :string

      timestamps()
    end

  end
end
