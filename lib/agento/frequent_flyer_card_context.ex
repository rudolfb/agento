defmodule Agento.FrequentFlyerCardContext do
  @moduledoc """
  The FrequentFlyerCardContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.FrequentFlyerCardContext.FrequentFlyerCard

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
end
