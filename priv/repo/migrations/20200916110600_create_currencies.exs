defmodule Agento.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :code, :string
      add :name, :string
      add :is_fund, :boolean, default: false, null: false
      add :is_complimentary, :boolean, default: false, null: false
      add :is_metal, :boolean, default: false, null: false

      timestamps()
    end

  end
end
