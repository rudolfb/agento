defmodule Agento.Repo.Migrations.AddFaciliygroupsTable do
  use Ecto.Migration

  # Business Facilities
  # Complimentary Amenities
  # Hotel Amenities
  # In Room Amenities
  # Leisure Facilities

  def change do
    create table(:facilitygroups) do
      add :facilitygroup, :string
      timestamps()
    end
  end
end
