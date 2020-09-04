# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Agento.Repo.insert!(%Agento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Agento.Repo
alias Agento.{Language}
alias Agento.{Country, CountryTrans}

defmodule Seed do
  def pad_leading_zero(string) do
    String.pad_leading(string, 3, "0")
  end

  def insert_languages do
    Repo.insert!(%Language{language: "en", default: true})
    Repo.insert!(%Language{language: "de", default: false})
    Repo.insert!(%Language{language: "fr", default: false})
    Repo.insert!(%Language{language: "it", default: false})
  end

  def insert_country_codes do
    File.stream!("priv/repo/files/ISO3166-1_CountryCodes.csv", [:trim_bom])
    |> CSV.decode(separator: ?;, headers: true)
    |> Enum.map(fn {:ok, x} ->
      struct(Country,
        alpha2: x["alpha2"],
        alpha3: x["alpha3"],
        numeric3: Seed.pad_leading_zero(x["numeric3"]),
        name: x["en"],
        countries_trans: [
          %CountryTrans{language: "de", name: x["de"]},
          %CountryTrans{language: "fr", name: x["fr"]},
          %CountryTrans{language: "en", name: x["en"]},
          %CountryTrans{language: "it", name: x["it"]}
        ]
      )
    end)
    |> Enum.each(fn country -> Repo.insert!(country) end)
  end
end

{time_in_microseconds_1, ret_val} = :timer.tc(fn -> Seed.insert_languages() end)

{time_in_microseconds_2, ret_val} = :timer.tc(fn -> Seed.insert_country_codes() end)

IO.inspect(Number.Delimit.number_to_delimited(time_in_microseconds_1))
IO.inspect(Number.Delimit.number_to_delimited(time_in_microseconds_2))
