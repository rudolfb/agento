defmodule Agento.Repo.Migrations.AddIdentificationsTable do
  use Ecto.Migration

  def change do
    create table (:identifications) do
      add :countryofissuecode, :string
      add: :dateofissue, :date
      add :documentcountrycode, :string
      add :documentnumber, :string
      add :expirationdate, :date
      add :identificationtypecode, :string
      add :ismainpassport, :boolean
      add :issuingauthority, :string
      add :placeofissue, :string
      add :individual_id, references(:individuals), null: false

      timestamps()
    end
  end
end
