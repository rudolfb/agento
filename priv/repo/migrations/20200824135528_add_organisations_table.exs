defmodule Agento.Repo.Migrations.AddOrganisationsTable do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add :abbreviation, :string
      add :foundationdate, :date
      add :begindate, :date
      add :correspondancelanguagecode1, string
      add :correspondancelanguagecode2, string
      add :correspondancelanguagecode3, string
      add :correspondancelanguagecode4, string
      add :description, :string
      add :enddate, :date
      add :countrycode, :string
      add :isdeleted, :boolean
      add :popularname, :string
      add :

    end

  end
end
