defmodule Agento.Repo.Migrations.AddCountriesTable do
  use Ecto.Migration

  # https://en.wikipedia.org/wiki/ISO_3166-1
  # For performance resons it makes sense to have a 1:1 relationship between the base
  # table and the translation table, so that the SQLs can all be implemented as
  # an INNER JOIN. Implementing SQLs with a LEFT OUTER JOINS has performance implications.
  # If a new language is added, this will however force us to add a new row in ALL the
  # translation tables for the new language.

  def change do
    create table("countries", comment: "ISO 3166-1") do
      add :alpha2, :string, size: 2, default: "", comment: "three-letter country code"
      add :alpha3, :string, size: 3, default: "", comment: "two-letter country code"
      add :numeric3, :string, size: 3, default: "", comment: "three-digit country code"
      add :name, :string, default: "", comment: "country name EN"

      # timestamps()
    end

    create table("countries_trans", comment: "translations for \"countries\"") do
      add :language, :string,
        size: 5,
        null: false,
        comment: "preferably a two letter country code, eg. de, en, fr, etc."

      add :name, :string, comment: "country name, in the relevant language"
      add :country_id, references("countries", on_delete: :restrict), null: false

      # timestamps()
    end
  end
end
