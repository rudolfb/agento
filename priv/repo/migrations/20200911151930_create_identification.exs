defmodule Agento.Repo.Migrations.CreateIdentification do
  use Ecto.Migration

  def change do
    create table(:identification) do
      add :dateofissue, :naive_datetime
      add :document_number, :string
      add :expirationdate, :naive_datetime
      add :identificationtypecode, :string
      add :is_main_passport, :boolean, default: false, null: false
      add :issuing_authority, :string
      add :place_of_issue, :string
      add :country_of_issue_id, references(:countries, on_delete: :nothing)
      add :document_country_code_id, references(:countries, on_delete: :nothing)
      add :individual_id, references(:individuals, on_delete: :nothing)

      timestamps()
    end

    create index(:identification, [:country_of_issue_id])
    create index(:identification, [:document_country_code_id])
    create index(:identification, [:individual_id])
  end
end
