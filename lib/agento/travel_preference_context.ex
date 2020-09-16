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
end
