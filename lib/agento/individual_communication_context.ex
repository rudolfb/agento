defmodule Agento.IndividualCommunicationContext do
  @moduledoc """
  The IndividualCommunicationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.IndividualCommunicationContext.IndividualCommunication

  @doc """
  Returns the list of individuals_communications.

  ## Examples

      iex> list_individuals_communications()
      [%IndividualCommunication{}, ...]

  """
  def list_individuals_communications do
    Repo.all(IndividualCommunication)
  end

  @doc """
  Gets a single individual_communication.

  Raises `Ecto.NoResultsError` if the Individual communication does not exist.

  ## Examples

      iex> get_individual_communication!(123)
      %IndividualCommunication{}

      iex> get_individual_communication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual_communication!(id), do: Repo.get!(IndividualCommunication, id)

  @doc """
  Creates a individual_communication.

  ## Examples

      iex> create_individual_communication(%{field: value})
      {:ok, %IndividualCommunication{}}

      iex> create_individual_communication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual_communication(attrs \\ %{}) do
    %IndividualCommunication{}
    |> IndividualCommunication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual_communication.

  ## Examples

      iex> update_individual_communication(individual_communication, %{field: new_value})
      {:ok, %IndividualCommunication{}}

      iex> update_individual_communication(individual_communication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual_communication(%IndividualCommunication{} = individual_communication, attrs) do
    individual_communication
    |> IndividualCommunication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual_communication.

  ## Examples

      iex> delete_individual_communication(individual_communication)
      {:ok, %IndividualCommunication{}}

      iex> delete_individual_communication(individual_communication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual_communication(%IndividualCommunication{} = individual_communication) do
    Repo.delete(individual_communication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual_communication changes.

  ## Examples

      iex> change_individual_communication(individual_communication)
      %Ecto.Changeset{data: %IndividualCommunication{}}

  """
  def change_individual_communication(%IndividualCommunication{} = individual_communication, attrs \\ %{}) do
    IndividualCommunication.changeset(individual_communication, attrs)
  end
end
