defmodule Agento.Repo.Migrations.CreateCommunicationTypeCodes do
  use Ecto.Migration

  def change do
    create table(:communication_type_codes) do
      add :code, :string

      timestamps()
    end

  end
end
