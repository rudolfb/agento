defmodule Agento.TravelCardContext do
  @moduledoc """
  The TravelCardContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.TravelCardContext.TravelCard

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
