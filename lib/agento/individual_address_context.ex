defmodule Agento.IndividualAddressContext do
  @moduledoc """
  The IndividualAddressContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.IndividualAddressContext.IndividualAddress

  @doc """
  Returns the list of individuals_addresses.

  ## Examples

      iex> list_individuals_addresses()
      [%IndividualAddress{}, ...]

  """
  def list_individuals_addresses do
    Repo.all(IndividualAddress)
  end

  @doc """
  Gets a single individual_address.

  Raises `Ecto.NoResultsError` if the Individual address does not exist.

  ## Examples

      iex> get_individual_address!(123)
      %IndividualAddress{}

      iex> get_individual_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual_address!(id), do: Repo.get!(IndividualAddress, id)

  @doc """
  Creates a individual_address.

  ## Examples

      iex> create_individual_address(%{field: value})
      {:ok, %IndividualAddress{}}

      iex> create_individual_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual_address(attrs \\ %{}) do
    %IndividualAddress{}
    |> IndividualAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual_address.

  ## Examples

      iex> update_individual_address(individual_address, %{field: new_value})
      {:ok, %IndividualAddress{}}

      iex> update_individual_address(individual_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual_address(%IndividualAddress{} = individual_address, attrs) do
    individual_address
    |> IndividualAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual_address.

  ## Examples

      iex> delete_individual_address(individual_address)
      {:ok, %IndividualAddress{}}

      iex> delete_individual_address(individual_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual_address(%IndividualAddress{} = individual_address) do
    Repo.delete(individual_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual_address changes.

  ## Examples

      iex> change_individual_address(individual_address)
      %Ecto.Changeset{data: %IndividualAddress{}}

  """
  def change_individual_address(%IndividualAddress{} = individual_address, attrs \\ %{}) do
    IndividualAddress.changeset(individual_address, attrs)
  end
end
