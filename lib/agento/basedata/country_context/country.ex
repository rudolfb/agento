defmodule Agento.Basedata.CountryContext.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :alpha2, :string, default: ""
    field :alpha3, :string, default: ""
    field :numeric3, :integer, default: 0
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:alpha2, :alpha3, :numeric3, :name])
    |> validate_required([:name])
    |> update_change(:alpha2, &String.upcase/1)
    |> update_change(:alpha3, &String.upcase/1)
    |> validate_length(:alpha2, max: 2)
    |> validate_length(:alpha3, max: 3)
    |> validate_number(:numeric3, greater_than_or_equal_to: 0, less_than_or_equal_to: 999)
    |> validate_format(:alpha2, ~r/^$|[A-Z]{2}/)
    |> validate_format(:alpha3, ~r/^$|[A-Z]{3}/)
    |> check_constraint(:numeric3,
      name: :numeric_only_with_alpha_check,
      message: "Alpha2 and Alpha3 must both be filled when Numeric3 is filled"
    )
    |> IO.inspect(label: "changeset")
  end
end
