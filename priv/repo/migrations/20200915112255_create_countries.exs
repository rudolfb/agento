defmodule Agento.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :alpha2, :string
      add :alpha3, :string
      add :numeric3, :string
      add :name, :string

      timestamps()
    end

  end
end
