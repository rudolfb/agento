defmodule Agento.OrganisationAddressContext do
  @moduledoc """
  The OrganisationAddressContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.OrganisationAddressContext.OrganisationAddress

  @doc """
  Returns the list of organisations_addresses.

  ## Examples

      iex> list_organisations_addresses()
      [%OrganisationAddress{}, ...]

  """
  def list_organisations_addresses do
    Repo.all(OrganisationAddress)
  end

  @doc """
  Gets a single organisation_address.

  Raises `Ecto.NoResultsError` if the Organisation address does not exist.

  ## Examples

      iex> get_organisation_address!(123)
      %OrganisationAddress{}

      iex> get_organisation_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organisation_address!(id), do: Repo.get!(OrganisationAddress, id)

  @doc """
  Creates a organisation_address.

  ## Examples

      iex> create_organisation_address(%{field: value})
      {:ok, %OrganisationAddress{}}

      iex> create_organisation_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organisation_address(attrs \\ %{}) do
    %OrganisationAddress{}
    |> OrganisationAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organisation_address.

  ## Examples

      iex> update_organisation_address(organisation_address, %{field: new_value})
      {:ok, %OrganisationAddress{}}

      iex> update_organisation_address(organisation_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organisation_address(%OrganisationAddress{} = organisation_address, attrs) do
    organisation_address
    |> OrganisationAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organisation_address.

  ## Examples

      iex> delete_organisation_address(organisation_address)
      {:ok, %OrganisationAddress{}}

      iex> delete_organisation_address(organisation_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organisation_address(%OrganisationAddress{} = organisation_address) do
    Repo.delete(organisation_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organisation_address changes.

  ## Examples

      iex> change_organisation_address(organisation_address)
      %Ecto.Changeset{data: %OrganisationAddress{}}

  """
  def change_organisation_address(%OrganisationAddress{} = organisation_address, attrs \\ %{}) do
    OrganisationAddress.changeset(organisation_address, attrs)
  end
end
