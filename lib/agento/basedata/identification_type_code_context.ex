defmodule Agento.Basedata.IdentificationTypeCodeContext do
  @moduledoc """
  The Basedata.IdentificationTypeCodeContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.IdentificationTypeCodeContext.IdentificationTypeCode

  @doc """
  Returns the list of identificationtypecodes.

  ## Examples

      iex> list_identificationtypecodes()
      [%IdentificationTypeCode{}, ...]

  """
  def list_identificationtypecodes do
    Repo.all(IdentificationTypeCode)
  end

  @doc """
  Gets a single identification_type_code.

  Raises `Ecto.NoResultsError` if the Identification type code does not exist.

  ## Examples

      iex> get_identification_type_code!(123)
      %IdentificationTypeCode{}

      iex> get_identification_type_code!(456)
      ** (Ecto.NoResultsError)

  """
  def get_identification_type_code!(id), do: Repo.get!(IdentificationTypeCode, id)

  @doc """
  Creates a identification_type_code.

  ## Examples

      iex> create_identification_type_code(%{field: value})
      {:ok, %IdentificationTypeCode{}}

      iex> create_identification_type_code(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_identification_type_code(attrs \\ %{}) do
    %IdentificationTypeCode{}
    |> IdentificationTypeCode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a identification_type_code.

  ## Examples

      iex> update_identification_type_code(identification_type_code, %{field: new_value})
      {:ok, %IdentificationTypeCode{}}

      iex> update_identification_type_code(identification_type_code, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_identification_type_code(%IdentificationTypeCode{} = identification_type_code, attrs) do
    identification_type_code
    |> IdentificationTypeCode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a identification_type_code.

  ## Examples

      iex> delete_identification_type_code(identification_type_code)
      {:ok, %IdentificationTypeCode{}}

      iex> delete_identification_type_code(identification_type_code)
      {:error, %Ecto.Changeset{}}

  """
  def delete_identification_type_code(%IdentificationTypeCode{} = identification_type_code) do
    Repo.delete(identification_type_code)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking identification_type_code changes.

  ## Examples

      iex> change_identification_type_code(identification_type_code)
      %Ecto.Changeset{data: %IdentificationTypeCode{}}

  """
  def change_identification_type_code(%IdentificationTypeCode{} = identification_type_code, attrs \\ %{}) do
    IdentificationTypeCode.changeset(identification_type_code, attrs)
  end
end
