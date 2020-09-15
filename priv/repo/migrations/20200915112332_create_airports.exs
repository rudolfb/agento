defmodule Agento.Repo.Migrations.CreateAirports do
  use Ecto.Migration

  def change do
    create table(:airports) do
      add :region_name, :string
      add :iata, :string
      add :icao, :string
      add :airport, :string
      add :latitude, :float
      add :longitude, :float
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:airports, [:country_id])
  end
end
