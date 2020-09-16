defmodule Agento.Repo.Migrations.CreateIndividuals do
  use Ecto.Migration

  def change do
    create table(:individuals) do
      add :lastname, :string
      add :firstname, :string
      add :gender, :string
      add :native_language_code, :string
      add :birthdate, :date
      add :dateofdeath, :date
      add :displayname, :string
      add :is_deleted, :boolean, default: false, null: false
      add :correspondancelanguage1_id, references(:languages, on_delete: :nothing)
      add :nationalitycountrycode_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:individuals, [:correspondancelanguage1_id])
    create index(:individuals, [:nationalitycountrycode_id])
  end
end
