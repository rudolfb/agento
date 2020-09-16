defmodule Agento.OrganisationNameTransContext do
  @moduledoc """
  The OrganisationNameTransContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.OrganisationNameTransContext.OrganisationNameTrans

  @doc """
  Returns the list of organisation_name_trans.

  ## Examples

      iex> list_organisation_name_trans()
      [%OrganisationNameTrans{}, ...]

  """
  def list_organisation_name_trans do
    Repo.all(OrganisationNameTrans)
  end

  @doc """
  Gets a single organisation_name_trans.

  Raises `Ecto.NoResultsError` if the Organisation name trans does not exist.

  ## Examples

      iex> get_organisation_name_trans!(123)
      %OrganisationNameTrans{}

      iex> get_organisation_name_trans!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organisation_name_trans!(id), do: Repo.get!(OrganisationNameTrans, id)

  @doc """
  Creates a organisation_name_trans.

  ## Examples

      iex> create_organisation_name_trans(%{field: value})
      {:ok, %OrganisationNameTrans{}}

      iex> create_organisation_name_trans(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organisation_name_trans(attrs \\ %{}) do
    %OrganisationNameTrans{}
    |> OrganisationNameTrans.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organisation_name_trans.

  ## Examples

      iex> update_organisation_name_trans(organisation_name_trans, %{field: new_value})
      {:ok, %OrganisationNameTrans{}}

      iex> update_organisation_name_trans(organisation_name_trans, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organisation_name_trans(%OrganisationNameTrans{} = organisation_name_trans, attrs) do
    organisation_name_trans
    |> OrganisationNameTrans.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organisation_name_trans.

  ## Examples

      iex> delete_organisation_name_trans(organisation_name_trans)
      {:ok, %OrganisationNameTrans{}}

      iex> delete_organisation_name_trans(organisation_name_trans)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organisation_name_trans(%OrganisationNameTrans{} = organisation_name_trans) do
    Repo.delete(organisation_name_trans)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organisation_name_trans changes.

  ## Examples

      iex> change_organisation_name_trans(organisation_name_trans)
      %Ecto.Changeset{data: %OrganisationNameTrans{}}

  """
  def change_organisation_name_trans(%OrganisationNameTrans{} = organisation_name_trans, attrs \\ %{}) do
    OrganisationNameTrans.changeset(organisation_name_trans, attrs)
  end
end
