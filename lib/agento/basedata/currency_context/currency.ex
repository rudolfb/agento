defmodule Agento.Basedata.CurrencyContext.Currency do
  use Ecto.Schema
  import Ecto.Changeset

  schema "currencies" do
    field :code, :string
    field :is_complimentary, :boolean, default: false
    field :is_fund, :boolean, default: false
    field :is_metal, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:code, :name, :is_fund, :is_complimentary, :is_metal])
    |> validate_required([:code, :name, :is_fund, :is_complimentary, :is_metal])
  end
end
