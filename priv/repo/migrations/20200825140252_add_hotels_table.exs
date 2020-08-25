defmodule Agento.Repo.Migrations.AddHotelsTable do
  use Ecto.Migration

  def change do
    create table(:hotels) do
      add :hotelname, :string
      add :hotelwebsiteurl, :string
      add :hoteldescription, :text
      add :hotelpageurl, :string
      add :thumbnailimage, :string
      add :starcategory_id, references(:starcategories, on_delete: :nothing)
      add :address_id, references(:addresses, on_delete: :nothing)
      add :citycode_id, references(:citycodes, on_delete: :nothing)
      add :checkintime, :time
      add :checkouttime, :time
      add :tel_telcoms_id, references(:telecoms, on_delete: :nothing)
      add :fax_telcoms_id, references(:telecoms, on_delete: :nothing)
      add :childasadult, :boolean
      add :childcutoff, :integer
      add :lat, :number
      add :lon, :number

      timestamps()
    end
  end
end
