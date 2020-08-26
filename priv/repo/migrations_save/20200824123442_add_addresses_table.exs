defmodule Agento.Repo.Migrations.AddAddressesTable do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :addresstypecode, :string
      add :begindate, :date
      add :city, :string
      add :enddate, :date
      add :countrycode, :string
      add :pobox, :string
      add :state, :string
      add :street1, :string
      add :street2, :string
      add :street3, :string
      add :zipcode, :string

      timestamps()
    end
  end
end
