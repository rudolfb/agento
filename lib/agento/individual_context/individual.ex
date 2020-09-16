defmodule Agento.IndividualContext.Individual do
  use Ecto.Schema
  import Ecto.Changeset

  schema "individuals" do
    field :birthdate, :date
    field :dateofdeath, :date
    field :displayname, :string
    field :firstname, :string
    field :gender, :string
    field :is_deleted, :boolean, default: false
    field :lastname, :string
    field :native_language_code, :string
    field :correspondancelanguage1_id, :id
    field :nationalitycountrycode_id, :id

    timestamps()
  end

  @doc false
  def changeset(individual, attrs) do
    individual
    |> cast(attrs, [:lastname, :firstname, :gender, :native_language_code, :birthdate, :dateofdeath, :displayname, :is_deleted])
    |> validate_required([:lastname, :firstname, :gender, :native_language_code, :birthdate, :dateofdeath, :displayname, :is_deleted])
  end
end
