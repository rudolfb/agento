defmodule Agento.Repo.Migrations.AddIndividualsTable do
  use Ecto.Migration

  def change do
    create table(:individuals) do
      add :birthdate, :date, null: true
      add :birthplace, :string, null: true
      add :corrlangcode1, :string, null: true
      add :corrlangcode2, :string, null: true
      add :corrlangcode3, :string, null: true
      add :corrlangcode4, :string, null: true
      add :dateofdeath, :date, null: true
      add :displayname, :string, null: true
      add :firstname, :string, null: true
      add :gender, :string, null: true
      add :individualid, :integer, null: true
      add :isdeleted, :bool, null: true
      add :lastname, :string, null: false
      add :nationalitycountrycode: string, null: true
      add :nativelanguagecode, :string, null: true
      add :popularname, :string, null: true

      timestamps()
    end
  end

  # create a addresses table
  # create a corrlangcode table
  # create a identifications table
  # create a relations table
  # create a roles table
  # create a telcoms table
  # create a travelpreferences table
  # create a relations table
  # create a addresstypecode table

end
