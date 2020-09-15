defmodule Agento.Repo.Migrations.CreateTravelcards do
  use Ecto.Migration

  def change do
    create table(:travelcards) do
      add :travelcardnumber, :string
      add :expiration, :naive_datetime
      add :travelcardtype, references(:travelcardtypes, on_delete: :nothing)
      add :travelpreference_id, references(:travelpreferences, on_delete: :nothing)

      timestamps()
    end

    create index(:travelcards, [:travelcardtype])
    create index(:travelcards, [:travelpreference_id])
  end
end
