defmodule Agento.Basedata.TravelCardTypeContext do
  @moduledoc """
  The Basedata.TravelCardTypeContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.TravelCardTypeContext.TravelCardType

  @doc """
  Returns the list of travelcardtypes.

  ## Examples

      iex> list_travelcardtypes()
      [%TravelCardType{}, ...]

  """
  def list_travelcardtypes do
    Repo.all(TravelCardType)
  end

  @doc """
  Gets a single travel_card_type.

  Raises `Ecto.NoResultsError` if the Travel card type does not exist.

  ## Examples

      iex> get_travel_card_type!(123)
      %TravelCardType{}

      iex> get_travel_card_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_card_type!(id), do: Repo.get!(TravelCardType, id)

  @doc """
  Creates a travel_card_type.

  ## Examples

      iex> create_travel_card_type(%{field: value})
      {:ok, %TravelCardType{}}

      iex> create_travel_card_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_card_type(attrs \\ %{}) do
    %TravelCardType{}
    |> TravelCardType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_card_type.

  ## Examples

      iex> update_travel_card_type(travel_card_type, %{field: new_value})
      {:ok, %TravelCardType{}}

      iex> update_travel_card_type(travel_card_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_card_type(%TravelCardType{} = travel_card_type, attrs) do
    travel_card_type
    |> TravelCardType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_card_type.

  ## Examples

      iex> delete_travel_card_type(travel_card_type)
      {:ok, %TravelCardType{}}

      iex> delete_travel_card_type(travel_card_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_card_type(%TravelCardType{} = travel_card_type) do
    Repo.delete(travel_card_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_card_type changes.

  ## Examples

      iex> change_travel_card_type(travel_card_type)
      %Ecto.Changeset{data: %TravelCardType{}}

  """
  def change_travel_card_type(%TravelCardType{} = travel_card_type, attrs \\ %{}) do
    TravelCardType.changeset(travel_card_type, attrs)
  end
end
