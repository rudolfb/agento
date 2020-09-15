defmodule Agento.Basedata.AddressContext do
  @moduledoc """
  The Basedata.AddressContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.AddressContext.AddressType

  @doc """
  Returns the list of addresstypes.

  ## Examples

      iex> list_addresstypes()
      [%AddressType{}, ...]

  """
  def list_addresstypes do
    Repo.all(AddressType)
  end

  @doc """
  Gets a single address_type.

  Raises `Ecto.NoResultsError` if the Address type does not exist.

  ## Examples

      iex> get_address_type!(123)
      %AddressType{}

      iex> get_address_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_address_type!(id), do: Repo.get!(AddressType, id)

  @doc """
  Creates a address_type.

  ## Examples

      iex> create_address_type(%{field: value})
      {:ok, %AddressType{}}

      iex> create_address_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_address_type(attrs \\ %{}) do
    %AddressType{}
    |> AddressType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a address_type.

  ## Examples

      iex> update_address_type(address_type, %{field: new_value})
      {:ok, %AddressType{}}

      iex> update_address_type(address_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_address_type(%AddressType{} = address_type, attrs) do
    address_type
    |> AddressType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a address_type.

  ## Examples

      iex> delete_address_type(address_type)
      {:ok, %AddressType{}}

      iex> delete_address_type(address_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_address_type(%AddressType{} = address_type) do
    Repo.delete(address_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking address_type changes.

  ## Examples

      iex> change_address_type(address_type)
      %Ecto.Changeset{data: %AddressType{}}

  """
  def change_address_type(%AddressType{} = address_type, attrs \\ %{}) do
    AddressType.changeset(address_type, attrs)
  end
end
