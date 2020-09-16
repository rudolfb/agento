defmodule Agento.IdentificationContext do
  @moduledoc """
  The IdentificationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.IdentificationContext.Identifications

  @doc """
  Returns the list of identification.

  ## Examples

      iex> list_identification()
      [%Identifications{}, ...]

  """
  def list_identification do
    Repo.all(Identifications)
  end

  @doc """
  Gets a single identifications.

  Raises `Ecto.NoResultsError` if the Identifications does not exist.

  ## Examples

      iex> get_identifications!(123)
      %Identifications{}

      iex> get_identifications!(456)
      ** (Ecto.NoResultsError)

  """
  def get_identifications!(id), do: Repo.get!(Identifications, id)

  @doc """
  Creates a identifications.

  ## Examples

      iex> create_identifications(%{field: value})
      {:ok, %Identifications{}}

      iex> create_identifications(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_identifications(attrs \\ %{}) do
    %Identifications{}
    |> Identifications.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a identifications.

  ## Examples

      iex> update_identifications(identifications, %{field: new_value})
      {:ok, %Identifications{}}

      iex> update_identifications(identifications, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_identifications(%Identifications{} = identifications, attrs) do
    identifications
    |> Identifications.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a identifications.

  ## Examples

      iex> delete_identifications(identifications)
      {:ok, %Identifications{}}

      iex> delete_identifications(identifications)
      {:error, %Ecto.Changeset{}}

  """
  def delete_identifications(%Identifications{} = identifications) do
    Repo.delete(identifications)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking identifications changes.

  ## Examples

      iex> change_identifications(identifications)
      %Ecto.Changeset{data: %Identifications{}}

  """
  def change_identifications(%Identifications{} = identifications, attrs \\ %{}) do
    Identifications.changeset(identifications, attrs)
  end
end
