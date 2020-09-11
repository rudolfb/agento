defmodule Agento.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :alpha2, :string, size: 2, default: "", comment: "three-letter country code"
      add :alpha3, :string, size: 3, default: "", comment: "two-letter country code"
      add :numeric3, :string, size: 3, default: "", comment: "three-digit country code"
      add :name, :string, default: "", comment: "country name EN"

      timestamps()
    end

    # create table(:countries_trans, comment: "translations for \"countries\"") do
    #   add :language, :string,
    #     size: 5,
    #     null: false,
    #     comment: "preferably a two letter country code, eg. de, en, fr, etc."

    #   add :name, :string, comment: "country name, in the relevant language"
    #   add :country_id, references(:countries, on_delete: :restrict), null: false

    #   timestamps()
    # end
  end
end
