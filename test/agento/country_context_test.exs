defmodule Agento.CountryContextTest do
  use Agento.DataCase

  alias Agento.CountryContext

  describe "countries" do
    alias Agento.CountryContext.Country

    @valid_attrs %{alpha2: "some alpha2", alpha3: "some alpha3", name: "some name", numeric3: "some numeric3"}
    @update_attrs %{alpha2: "some updated alpha2", alpha3: "some updated alpha3", name: "some updated name", numeric3: "some updated numeric3"}
    @invalid_attrs %{alpha2: nil, alpha3: nil, name: nil, numeric3: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CountryContext.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert CountryContext.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert CountryContext.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = CountryContext.create_country(@valid_attrs)
      assert country.alpha2 == "some alpha2"
      assert country.alpha3 == "some alpha3"
      assert country.name == "some name"
      assert country.numeric3 == "some numeric3"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CountryContext.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, %Country{} = country} = CountryContext.update_country(country, @update_attrs)
      assert country.alpha2 == "some updated alpha2"
      assert country.alpha3 == "some updated alpha3"
      assert country.name == "some updated name"
      assert country.numeric3 == "some updated numeric3"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = CountryContext.update_country(country, @invalid_attrs)
      assert country == CountryContext.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = CountryContext.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> CountryContext.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = CountryContext.change_country(country)
    end
  end
end
