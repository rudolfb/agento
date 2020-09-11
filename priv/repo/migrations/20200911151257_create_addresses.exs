defmodule Agento.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street1, :string
      add :street2, :string
      add :city, :string
      add :zipcode, :string
      add :state, :string
      add :pobox, :string
      add :is_pobox, :boolean, default: false, null: false
      add :begindate, :naive_datetime
      add :enddate, :naive_datetime
      add :active, :boolean, default: false, null: false
      add :country_id, references(:countries, on_delete: :nothing)
      add :addresstype_id, references(:addresstypes, on_delete: :nothing)

      timestamps()
    end

    create index(:addresses, [:country_id])
    create index(:addresses, [:addresstype_id])
  end
end
