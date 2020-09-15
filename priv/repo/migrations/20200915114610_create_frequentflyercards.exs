defmodule Agento.Repo.Migrations.CreateFrequentflyercards do
  use Ecto.Migration

  def change do
    create table(:frequentflyercards) do
      add :airline_name, :string
      add :airline_iata_code, :string
      add :frequent_flyer_number, :string
      add :travelpreference_id, references(:travelpreferences, on_delete: :nothing)

      timestamps()
    end

    create index(:frequentflyercards, [:travelpreference_id])
  end
end
