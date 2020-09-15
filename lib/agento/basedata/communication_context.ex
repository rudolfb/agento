defmodule Agento.Basedata.CommunicationContext do
  @moduledoc """
  The Basedata.CommunicationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.CommunicationContext.CommunicationTypeCode

  @doc """
  Returns the list of communication_type_codes.

  ## Examples

      iex> list_communication_type_codes()
      [%CommunicationTypeCode{}, ...]

  """
  def list_communication_type_codes do
    Repo.all(CommunicationTypeCode)
  end

  @doc """
  Gets a single communication_type_code.

  Raises `Ecto.NoResultsError` if the Communication type code does not exist.

  ## Examples

      iex> get_communication_type_code!(123)
      %CommunicationTypeCode{}

      iex> get_communication_type_code!(456)
      ** (Ecto.NoResultsError)

  """
  def get_communication_type_code!(id), do: Repo.get!(CommunicationTypeCode, id)

  @doc """
  Creates a communication_type_code.

  ## Examples

      iex> create_communication_type_code(%{field: value})
      {:ok, %CommunicationTypeCode{}}

      iex> create_communication_type_code(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_communication_type_code(attrs \\ %{}) do
    %CommunicationTypeCode{}
    |> CommunicationTypeCode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a communication_type_code.

  ## Examples

      iex> update_communication_type_code(communication_type_code, %{field: new_value})
      {:ok, %CommunicationTypeCode{}}

      iex> update_communication_type_code(communication_type_code, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_communication_type_code(%CommunicationTypeCode{} = communication_type_code, attrs) do
    communication_type_code
    |> CommunicationTypeCode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a communication_type_code.

  ## Examples

      iex> delete_communication_type_code(communication_type_code)
      {:ok, %CommunicationTypeCode{}}

      iex> delete_communication_type_code(communication_type_code)
      {:error, %Ecto.Changeset{}}

  """
  def delete_communication_type_code(%CommunicationTypeCode{} = communication_type_code) do
    Repo.delete(communication_type_code)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking communication_type_code changes.

  ## Examples

      iex> change_communication_type_code(communication_type_code)
      %Ecto.Changeset{data: %CommunicationTypeCode{}}

  """
  def change_communication_type_code(%CommunicationTypeCode{} = communication_type_code, attrs \\ %{}) do
    CommunicationTypeCode.changeset(communication_type_code, attrs)
  end
end
