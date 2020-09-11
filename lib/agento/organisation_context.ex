defmodule Agento.OrganisationContext do
  @moduledoc """
  The OrganisationContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.OrganisationContext.Organisation

  @doc """
  Returns the list of organisations.

  ## Examples

      iex> list_organisations()
      [%Organisation{}, ...]

  """
  def list_organisations do
    Repo.all(Organisation)
  end

  @doc """
  Gets a single organisation.

  Raises `Ecto.NoResultsError` if the Organisation does not exist.

  ## Examples

      iex> get_organisation!(123)
      %Organisation{}

      iex> get_organisation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organisation!(id), do: Repo.get!(Organisation, id)

  @doc """
  Creates a organisation.

  ## Examples

      iex> create_organisation(%{field: value})
      {:ok, %Organisation{}}

      iex> create_organisation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organisation(attrs \\ %{}) do
    %Organisation{}
    |> Organisation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organisation.

  ## Examples

      iex> update_organisation(organisation, %{field: new_value})
      {:ok, %Organisation{}}

      iex> update_organisation(organisation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organisation(%Organisation{} = organisation, attrs) do
    organisation
    |> Organisation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organisation.

  ## Examples

      iex> delete_organisation(organisation)
      {:ok, %Organisation{}}

      iex> delete_organisation(organisation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organisation(%Organisation{} = organisation) do
    Repo.delete(organisation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organisation changes.

  ## Examples

      iex> change_organisation(organisation)
      %Ecto.Changeset{data: %Organisation{}}

  """
  def change_organisation(%Organisation{} = organisation, attrs \\ %{}) do
    Organisation.changeset(organisation, attrs)
  end

  alias Agento.OrganisationContext.OrganisationNameTrans

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

  alias Agento.OrganisationContext.OrganisationAddress

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

  alias Agento.OrganisationContext.OrganisationCommunications

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
