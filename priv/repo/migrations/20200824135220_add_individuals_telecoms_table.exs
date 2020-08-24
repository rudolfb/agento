defmodule Agento.Repo.Migrations.AddIndividualsTelcomsTable do
  use Ecto.Migration

  # telecomtypecode: EML, MTEL, TELB, TELP, FAXB, FAXP
  # Can be suffixed with _2 or _3 when more than one entry of a type has been entered.

  def change do
    create table(:individual_telecoms) do
      add :telecomnumber, :string
      add :telecomtypecode, :string
      add :individual_id, references(:individuals), null: false

      timestamps()
    end
  end
end
