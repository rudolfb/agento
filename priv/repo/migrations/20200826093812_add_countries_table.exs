defmodule Agento.Repo.Migrations.AddCountriesTable do
  use Ecto.Migration

  # https://en.wikipedia.org/wiki/ISO_3166-1

  def change do
    create table("countries", comment: "ISO 3166-1") do
      add :alpha2, :string, size: 2, default: "", comment: "three-letter country code"
      add :alpha3, :string, size: 3, default: "", comment: "two-letter country code"
      add :numeric3, :string, size: 3, default: "", comment: "three-digit country code"
    end
  end
end
