defmodule Agento.Repo.Migrations.CreateTravelcardtypes do
  use Ecto.Migration

  def change do
    create table(:travelcardtypes) do
      add :name, :string

      timestamps()
    end

  end
end
