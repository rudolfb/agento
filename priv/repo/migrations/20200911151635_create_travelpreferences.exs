defmodule Agento.Repo.Migrations.CreateTravelpreferences do
  use Ecto.Migration

  def change do
    create table(:travelpreferences) do
      add :has_wheelchair, :boolean, default: false, null: false
      add :homeairport_location, :string
      add :labelname, :string
      add :mealtype_code, :string
      add :preferred_aircraft_seat_type_code, :string
      add :individual_id, references(:individuals, on_delete: :nothing)

      timestamps()
    end

    create index(:travelpreferences, [:individual_id])
  end
end
