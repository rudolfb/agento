defmodule Agento.OrganisationCommunicationContext do
  @moduledoc """
  The OrganisationCommunicationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.OrganisationCommunicationContext.OrganisationCommunications

  @doc """
  Returns the list of organisations_communications.

  ## Examples

      iex> list_organisations_communications()
      [%OrganisationCommunications{}, ...]

  """
  def list_organisations_communications do
    Repo.all(OrganisationCommunications)
  end

  @doc """
  Gets a single organisation_communications.

  Raises `Ecto.NoResultsError` if the Organisation communications does not exist.

  ## Examples

      iex> get_organisation_communications!(123)
      %OrganisationCommunications{}

      iex> get_organisation_communications!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organisation_communications!(id), do: Repo.get!(OrganisationCommunications, id)

  @doc """
  Creates a organisation_communications.

  ## Examples

      iex> create_organisation_communications(%{field: value})
      {:ok, %OrganisationCommunications{}}

      iex> create_organisation_communications(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organisation_communications(attrs \\ %{}) do
    %OrganisationCommunications{}
    |> OrganisationCommunications.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organisation_communications.

  ## Examples

      iex> update_organisation_communications(organisation_communications, %{field: new_value})
      {:ok, %OrganisationCommunications{}}

      iex> update_organisation_communications(organisation_communications, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organisation_communications(%OrganisationCommunications{} = organisation_communications, attrs) do
    organisation_communications
    |> OrganisationCommunications.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organisation_communications.

  ## Examples

      iex> delete_organisation_communications(organisation_communications)
      {:ok, %OrganisationCommunications{}}

      iex> delete_organisation_communications(organisation_communications)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organisation_communications(%OrganisationCommunications{} = organisation_communications) do
    Repo.delete(organisation_communications)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organisation_communications changes.

  ## Examples

      iex> change_organisation_communications(organisation_communications)
      %Ecto.Changeset{data: %OrganisationCommunications{}}

  """
  def change_organisation_communications(%OrganisationCommunications{} = organisation_communications, attrs \\ %{}) do
    OrganisationCommunications.changeset(organisation_communications, attrs)
  end
end
