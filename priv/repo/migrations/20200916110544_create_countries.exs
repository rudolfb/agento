defmodule Agento.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :alpha2, :string
      add :alpha3, :string
      add :numeric3, :integer, null: false
      add :name, :string, null: false

      timestamps()
    end

    numeric_only_with_alpha_check = """
    ( coalesce(alpha2,'')='' and coalesce(alpha3,'')='' and coalesce(numeric3,0)=0)
    or ( coalesce(alpha2,'')<>'' and coalesce(alpha3,'')<>'' and coalesce(numeric3,0)<>0)
    or ( coalesce(alpha2,'')<>'' and coalesce(numeric3,0)=0)
    """

    create constraint(:countries, :numeric_only_with_alpha_check,
             check: numeric_only_with_alpha_check
           )
  end
end
