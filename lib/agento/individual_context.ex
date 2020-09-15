defmodule Agento.IndividualContext do
  @moduledoc """
  The IndividualContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.IndividualContext.Individual

  @doc """
  Returns the list of individuals.

  ## Examples

      iex> list_individuals()
      [%Individual{}, ...]

  """
  def list_individuals do
    Repo.all(Individual)
  end

  @doc """
  Gets a single individual.

  Raises `Ecto.NoResultsError` if the Individual does not exist.

  ## Examples

      iex> get_individual!(123)
      %Individual{}

      iex> get_individual!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual!(id), do: Repo.get!(Individual, id)

  @doc """
  Creates a individual.

  ## Examples

      iex> create_individual(%{field: value})
      {:ok, %Individual{}}

      iex> create_individual(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual(attrs \\ %{}) do
    %Individual{}
    |> Individual.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual.

  ## Examples

      iex> update_individual(individual, %{field: new_value})
      {:ok, %Individual{}}

      iex> update_individual(individual, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual(%Individual{} = individual, attrs) do
    individual
    |> Individual.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual.

  ## Examples

      iex> delete_individual(individual)
      {:ok, %Individual{}}

      iex> delete_individual(individual)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual(%Individual{} = individual) do
    Repo.delete(individual)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual changes.

  ## Examples

      iex> change_individual(individual)
      %Ecto.Changeset{data: %Individual{}}

  """
  def change_individual(%Individual{} = individual, attrs \\ %{}) do
    Individual.changeset(individual, attrs)
  end
end
