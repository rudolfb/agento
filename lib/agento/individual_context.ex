defmodule Agento.IndividualContext do
  @moduledoc """
  The IndividualContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.IndividualContext.Individual

  @doc """
  Returns the list of individuals.

  ## Examples

      iex> list_individuals()
      [%Individual{}, ...]

  """
  def list_individuals do
    Repo.all(Individual)
  end

  @doc """
  Gets a single individual.

  Raises `Ecto.NoResultsError` if the Individual does not exist.

  ## Examples

      iex> get_individual!(123)
      %Individual{}

      iex> get_individual!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual!(id), do: Repo.get!(Individual, id)

  @doc """
  Creates a individual.

  ## Examples

      iex> create_individual(%{field: value})
      {:ok, %Individual{}}

      iex> create_individual(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual(attrs \\ %{}) do
    %Individual{}
    |> Individual.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual.

  ## Examples

      iex> update_individual(individual, %{field: new_value})
      {:ok, %Individual{}}

      iex> update_individual(individual, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual(%Individual{} = individual, attrs) do
    individual
    |> Individual.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual.

  ## Examples

      iex> delete_individual(individual)
      {:ok, %Individual{}}

      iex> delete_individual(individual)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual(%Individual{} = individual) do
    Repo.delete(individual)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual changes.

  ## Examples

      iex> change_individual(individual)
      %Ecto.Changeset{data: %Individual{}}

  """
  def change_individual(%Individual{} = individual, attrs \\ %{}) do
    Individual.changeset(individual, attrs)
  end

  alias Agento.IndividualContext.IndividualAddress

  @doc """
  Returns the list of individuals_addresses.

  ## Examples

      iex> list_individuals_addresses()
      [%IndividualAddress{}, ...]

  """
  def list_individuals_addresses do
    Repo.all(IndividualAddress)
  end

  @doc """
  Gets a single individual_address.

  Raises `Ecto.NoResultsError` if the Individual address does not exist.

  ## Examples

      iex> get_individual_address!(123)
      %IndividualAddress{}

      iex> get_individual_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual_address!(id), do: Repo.get!(IndividualAddress, id)

  @doc """
  Creates a individual_address.

  ## Examples

      iex> create_individual_address(%{field: value})
      {:ok, %IndividualAddress{}}

      iex> create_individual_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual_address(attrs \\ %{}) do
    %IndividualAddress{}
    |> IndividualAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual_address.

  ## Examples

      iex> update_individual_address(individual_address, %{field: new_value})
      {:ok, %IndividualAddress{}}

      iex> update_individual_address(individual_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual_address(%IndividualAddress{} = individual_address, attrs) do
    individual_address
    |> IndividualAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual_address.

  ## Examples

      iex> delete_individual_address(individual_address)
      {:ok, %IndividualAddress{}}

      iex> delete_individual_address(individual_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual_address(%IndividualAddress{} = individual_address) do
    Repo.delete(individual_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual_address changes.

  ## Examples

      iex> change_individual_address(individual_address)
      %Ecto.Changeset{data: %IndividualAddress{}}

  """
  def change_individual_address(%IndividualAddress{} = individual_address, attrs \\ %{}) do
    IndividualAddress.changeset(individual_address, attrs)
  end

  alias Agento.IndividualContext.IndividualCommunication

  @doc """
  Returns the list of individuals_communications.

  ## Examples

      iex> list_individuals_communications()
      [%IndividualCommunication{}, ...]

  """
  def list_individuals_communications do
    Repo.all(IndividualCommunication)
  end

  @doc """
  Gets a single individual_communication.

  Raises `Ecto.NoResultsError` if the Individual communication does not exist.

  ## Examples

      iex> get_individual_communication!(123)
      %IndividualCommunication{}

      iex> get_individual_communication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual_communication!(id), do: Repo.get!(IndividualCommunication, id)

  @doc """
  Creates a individual_communication.

  ## Examples

      iex> create_individual_communication(%{field: value})
      {:ok, %IndividualCommunication{}}

      iex> create_individual_communication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual_communication(attrs \\ %{}) do
    %IndividualCommunication{}
    |> IndividualCommunication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual_communication.

  ## Examples

      iex> update_individual_communication(individual_communication, %{field: new_value})
      {:ok, %IndividualCommunication{}}

      iex> update_individual_communication(individual_communication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual_communication(%IndividualCommunication{} = individual_communication, attrs) do
    individual_communication
    |> IndividualCommunication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a individual_communication.

  ## Examples

      iex> delete_individual_communication(individual_communication)
      {:ok, %IndividualCommunication{}}

      iex> delete_individual_communication(individual_communication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual_communication(%IndividualCommunication{} = individual_communication) do
    Repo.delete(individual_communication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual_communication changes.

  ## Examples

      iex> change_individual_communication(individual_communication)
      %Ecto.Changeset{data: %IndividualCommunication{}}

  """
  def change_individual_communication(%IndividualCommunication{} = individual_communication, attrs \\ %{}) do
    IndividualCommunication.changeset(individual_communication, attrs)
  end

  alias Agento.IndividualContext.TravelPreference

  @doc """
  Returns the list of travelpreferences.

  ## Examples

      iex> list_travelpreferences()
      [%TravelPreference{}, ...]

  """
  def list_travelpreferences do
    Repo.all(TravelPreference)
  end

  @doc """
  Gets a single travel_preference.

  Raises `Ecto.NoResultsError` if the Travel preference does not exist.

  ## Examples

      iex> get_travel_preference!(123)
      %TravelPreference{}

      iex> get_travel_preference!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_preference!(id), do: Repo.get!(TravelPreference, id)

  @doc """
  Creates a travel_preference.

  ## Examples

      iex> create_travel_preference(%{field: value})
      {:ok, %TravelPreference{}}

      iex> create_travel_preference(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_preference(attrs \\ %{}) do
    %TravelPreference{}
    |> TravelPreference.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_preference.

  ## Examples

      iex> update_travel_preference(travel_preference, %{field: new_value})
      {:ok, %TravelPreference{}}

      iex> update_travel_preference(travel_preference, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_preference(%TravelPreference{} = travel_preference, attrs) do
    travel_preference
    |> TravelPreference.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_preference.

  ## Examples

      iex> delete_travel_preference(travel_preference)
      {:ok, %TravelPreference{}}

      iex> delete_travel_preference(travel_preference)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_preference(%TravelPreference{} = travel_preference) do
    Repo.delete(travel_preference)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_preference changes.

  ## Examples

      iex> change_travel_preference(travel_preference)
      %Ecto.Changeset{data: %TravelPreference{}}

  """
  def change_travel_preference(%TravelPreference{} = travel_preference, attrs \\ %{}) do
    TravelPreference.changeset(travel_preference, attrs)
  end

  alias Agento.IndividualContext.FrequentFlyerCard

  @doc """
  Returns the list of frequentflyercards.

  ## Examples

      iex> list_frequentflyercards()
      [%FrequentFlyerCard{}, ...]

  """
  def list_frequentflyercards do
    Repo.all(FrequentFlyerCard)
  end

  @doc """
  Gets a single frequent_flyer_card.

  Raises `Ecto.NoResultsError` if the Frequent flyer card does not exist.

  ## Examples

      iex> get_frequent_flyer_card!(123)
      %FrequentFlyerCard{}

      iex> get_frequent_flyer_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_frequent_flyer_card!(id), do: Repo.get!(FrequentFlyerCard, id)

  @doc """
  Creates a frequent_flyer_card.

  ## Examples

      iex> create_frequent_flyer_card(%{field: value})
      {:ok, %FrequentFlyerCard{}}

      iex> create_frequent_flyer_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_frequent_flyer_card(attrs \\ %{}) do
    %FrequentFlyerCard{}
    |> FrequentFlyerCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a frequent_flyer_card.

  ## Examples

      iex> update_frequent_flyer_card(frequent_flyer_card, %{field: new_value})
      {:ok, %FrequentFlyerCard{}}

      iex> update_frequent_flyer_card(frequent_flyer_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card, attrs) do
    frequent_flyer_card
    |> FrequentFlyerCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a frequent_flyer_card.

  ## Examples

      iex> delete_frequent_flyer_card(frequent_flyer_card)
      {:ok, %FrequentFlyerCard{}}

      iex> delete_frequent_flyer_card(frequent_flyer_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card) do
    Repo.delete(frequent_flyer_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking frequent_flyer_card changes.

  ## Examples

      iex> change_frequent_flyer_card(frequent_flyer_card)
      %Ecto.Changeset{data: %FrequentFlyerCard{}}

  """
  def change_frequent_flyer_card(%FrequentFlyerCard{} = frequent_flyer_card, attrs \\ %{}) do
    FrequentFlyerCard.changeset(frequent_flyer_card, attrs)
  end

  alias Agento.IndividualContext.TravelCard

  @doc """
  Returns the list of travelcards.

  ## Examples

      iex> list_travelcards()
      [%TravelCard{}, ...]

  """
  def list_travelcards do
    Repo.all(TravelCard)
  end

  @doc """
  Gets a single travel_card.

  Raises `Ecto.NoResultsError` if the Travel card does not exist.

  ## Examples

      iex> get_travel_card!(123)
      %TravelCard{}

      iex> get_travel_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_travel_card!(id), do: Repo.get!(TravelCard, id)

  @doc """
  Creates a travel_card.

  ## Examples

      iex> create_travel_card(%{field: value})
      {:ok, %TravelCard{}}

      iex> create_travel_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_travel_card(attrs \\ %{}) do
    %TravelCard{}
    |> TravelCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a travel_card.

  ## Examples

      iex> update_travel_card(travel_card, %{field: new_value})
      {:ok, %TravelCard{}}

      iex> update_travel_card(travel_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_travel_card(%TravelCard{} = travel_card, attrs) do
    travel_card
    |> TravelCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a travel_card.

  ## Examples

      iex> delete_travel_card(travel_card)
      {:ok, %TravelCard{}}

      iex> delete_travel_card(travel_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_travel_card(%TravelCard{} = travel_card) do
    Repo.delete(travel_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking travel_card changes.

  ## Examples

      iex> change_travel_card(travel_card)
      %Ecto.Changeset{data: %TravelCard{}}

  """
  def change_travel_card(%TravelCard{} = travel_card, attrs \\ %{}) do
    TravelCard.changeset(travel_card, attrs)
  end

  alias Agento.IndividualContext.Identifications

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
