defmodule Agento.Basedata.RoleTypeContext do
  @moduledoc """
  The Basedata.RoleTypeContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.RoleTypeContext.RoleType

  @doc """
  Returns the list of roletypes.

  ## Examples

      iex> list_roletypes()
      [%RoleType{}, ...]

  """
  def list_roletypes do
    Repo.all(RoleType)
  end

  @doc """
  Gets a single role_type.

  Raises `Ecto.NoResultsError` if the Role type does not exist.

  ## Examples

      iex> get_role_type!(123)
      %RoleType{}

      iex> get_role_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role_type!(id), do: Repo.get!(RoleType, id)

  @doc """
  Creates a role_type.

  ## Examples

      iex> create_role_type(%{field: value})
      {:ok, %RoleType{}}

      iex> create_role_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role_type(attrs \\ %{}) do
    %RoleType{}
    |> RoleType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role_type.

  ## Examples

      iex> update_role_type(role_type, %{field: new_value})
      {:ok, %RoleType{}}

      iex> update_role_type(role_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role_type(%RoleType{} = role_type, attrs) do
    role_type
    |> RoleType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role_type.

  ## Examples

      iex> delete_role_type(role_type)
      {:ok, %RoleType{}}

      iex> delete_role_type(role_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role_type(%RoleType{} = role_type) do
    Repo.delete(role_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role_type changes.

  ## Examples

      iex> change_role_type(role_type)
      %Ecto.Changeset{data: %RoleType{}}

  """
  def change_role_type(%RoleType{} = role_type, attrs \\ %{}) do
    RoleType.changeset(role_type, attrs)
  end
end
