defmodule Agento.CommunicationContext do
  @moduledoc """
  The CommunicationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.CommunicationContext.Communication

  @doc """
  Returns the list of communications.

  ## Examples

      iex> list_communications()
      [%Communication{}, ...]

  """
  def list_communications do
    Repo.all(Communication)
  end

  @doc """
  Gets a single communication.

  Raises `Ecto.NoResultsError` if the Communication does not exist.

  ## Examples

      iex> get_communication!(123)
      %Communication{}

      iex> get_communication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_communication!(id), do: Repo.get!(Communication, id)

  @doc """
  Creates a communication.

  ## Examples

      iex> create_communication(%{field: value})
      {:ok, %Communication{}}

      iex> create_communication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_communication(attrs \\ %{}) do
    %Communication{}
    |> Communication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a communication.

  ## Examples

      iex> update_communication(communication, %{field: new_value})
      {:ok, %Communication{}}

      iex> update_communication(communication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_communication(%Communication{} = communication, attrs) do
    communication
    |> Communication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a communication.

  ## Examples

      iex> delete_communication(communication)
      {:ok, %Communication{}}

      iex> delete_communication(communication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_communication(%Communication{} = communication) do
    Repo.delete(communication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking communication changes.

  ## Examples

      iex> change_communication(communication)
      %Ecto.Changeset{data: %Communication{}}

  """
  def change_communication(%Communication{} = communication, attrs \\ %{}) do
    Communication.changeset(communication, attrs)
  end
end
