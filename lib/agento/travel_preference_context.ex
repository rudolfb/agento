defmodule Agento.TravelPreferenceContext do
  @moduledoc """
  The TravelPreferenceContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.TravelPreferenceContext.TravelPreference

  @doc """
  Returns the list of travelpreferences.

  ## Examples

      iex> list_travelpreferences()
      [%TravelPreference{}, ...]

  """
  def list_travelpreferences do
    Repo.all(TravelPreference)
  end

  @doc """
  Gets a single travel_preference.

  Raises `Ecto.NoResultsError` if the Travel preference does not exist.

  ## Examples

      iex> get_travel_preference!(123)
      %TravelPreference{}

      iex> get_travel_preference!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_preference!(id), do: Repo.get!(TravelPreference, id)

  @doc """
  Creates a travel_preference.

  ## Examples

      iex> create_travel_preference(%{field: value})
      {:ok, %TravelPreference{}}

      iex> create_travel_preference(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_preference(attrs \\ %{}) do
    %TravelPreference{}
    |> TravelPreference.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_preference.

  ## Examples

      iex> update_travel_preference(travel_preference, %{field: new_value})
      {:ok, %TravelPreference{}}

      iex> update_travel_preference(travel_preference, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_preference(%TravelPreference{} = travel_preference, attrs) do
    travel_preference
    |> TravelPreference.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_preference.

  ## Examples

      iex> delete_travel_preference(travel_preference)
      {:ok, %TravelPreference{}}

      iex> delete_travel_preference(travel_preference)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_preference(%TravelPreference{} = travel_preference) do
    Repo.delete(travel_preference)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_preference changes.

  ## Examples

      iex> change_travel_preference(travel_preference)
      %Ecto.Changeset{data: %TravelPreference{}}

  """
  def change_travel_preference(%TravelPreference{} = travel_preference, attrs \\ %{}) do
    TravelPreference.changeset(travel_preference, attrs)
  end

  alias Agento.TravelPreferenceContext.FrequentFlyerCard

  @doc """
  Returns the list of frequentflyercards.

  ## Examples

      iex> list_frequentflyercards()
      [%FrequentFlyerCard{}, ...]

  """
  def list_frequentflyercards do
    Repo.all(FrequentFlyerCard)
  end

  @doc """
  Gets a single frequent_flyer_card.

  Raises `Ecto.NoResultsError` if the Frequent flyer card does not exist.

  ## Examples

      iex> get_frequent_flyer_card!(123)
      %FrequentFlyerCard{}

      iex> get_frequent_flyer_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frequent_flyer_card!(id), do: Repo.get!(FrequentFlyerCard, id)

  @doc """
  Creates a frequent_flyer_card.

  ## Examples

      iex> create_frequent_flyer_card(%{field: value})
      {:ok, %FrequentFlyerCard{}}

      iex> create_frequent_flyer_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frequent_flyer_card(attrs \\ %{}) do
    %FrequentFlyerCard{}
    |> FrequentFlyerCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frequent_flyer_card.

  ## Examples

      iex> update_frequent_flyer_card(frequent_flyer_card, %{field: new_value})
      {:ok, %FrequentFlyerCard{}}

      iex> update_frequent_flyer_card(frequent_flyer_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card, attrs) do
    frequent_flyer_card
    |> FrequentFlyerCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frequent_flyer_card.

  ## Examples

      iex> delete_frequent_flyer_card(frequent_flyer_card)
      {:ok, %FrequentFlyerCard{}}

      iex> delete_frequent_flyer_card(frequent_flyer_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card) do
    Repo.delete(frequent_flyer_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frequent_flyer_card changes.

  ## Examples

      iex> change_frequent_flyer_card(frequent_flyer_card)
      %Ecto.Changeset{data: %FrequentFlyerCard{}}

  """
  def change_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card, attrs \\ %{}) do
    FrequentFlyerCard.changeset(frequent_flyer_card, attrs)
  end

  alias Agento.TravelPreferenceContext.TravelCard

  @doc """
  Returns the list of travelcards.

  ## Examples

      iex> list_travelcards()
      [%TravelCard{}, ...]

  """
  def list_travelcards do
    Repo.all(TravelCard)
  end

  @doc """
  Gets a single travel_card.

  Raises `Ecto.NoResultsError` if the Travel card does not exist.

  ## Examples

      iex> get_travel_card!(123)
      %TravelCard{}

      iex> get_travel_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_card!(id), do: Repo.get!(TravelCard, id)

  @doc """
  Creates a travel_card.

  ## Examples

      iex> create_travel_card(%{field: value})
      {:ok, %TravelCard{}}

      iex> create_travel_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_card(attrs \\ %{}) do
    %TravelCard{}
    |> TravelCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_card.

  ## Examples

      iex> update_travel_card(travel_card, %{field: new_value})
      {:ok, %TravelCard{}}

      iex> update_travel_card(travel_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_card(%TravelCard{} = travel_card, attrs) do
    travel_card
    |> TravelCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_card.

  ## Examples

      iex> delete_travel_card(travel_card)
      {:ok, %TravelCard{}}

      iex> delete_travel_card(travel_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_card(%TravelCard{} = travel_card) do
    Repo.delete(travel_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_card changes.

  ## Examples

      iex> change_travel_card(travel_card)
      %Ecto.Changeset{data: %TravelCard{}}

  """
  def change_travel_card(%TravelCard{} = travel_card, attrs \\ %{}) do
    TravelCard.changeset(travel_card, attrs)
  end
end
