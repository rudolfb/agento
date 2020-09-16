defmodule Agento.Repo.Migrations.CreateAirlines do
  use Ecto.Migration

  def change do
    create table(:airlines) do
      add :id_nr, :string
      add :name, :string
      add :alias, :string
      add :iata, :string
      add :icao, :string
      add :callsign, :string
      add :country_name, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
