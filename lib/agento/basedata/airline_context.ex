defmodule Agento.Basedata.AirlineContext do
  @moduledoc """
  The Basedata.AirlineContext context.
  """

  import Ecto.Query, warn: false
  alias Agento.Repo

  alias Agento.Basedata.AirlineContext.Airline

  @doc """
  Returns the list of airlines.

  ## Examples

      iex> list_airlines()
      [%Airline{}, ...]

  """
  def list_airlines do
    Repo.all(Airline)
  end

  @doc """
  Gets a single airline.

  Raises `Ecto.NoResultsError` if the Airline does not exist.

  ## Examples

      iex> get_airline!(123)
      %Airline{}

      iex> get_airline!(456)
      ** (Ecto.NoResultsError)

  """
  def get_airline!(id), do: Repo.get!(Airline, id)

  @doc """
  Creates a airline.

  ## Examples

      iex> create_airline(%{field: value})
      {:ok, %Airline{}}

      iex> create_airline(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_airline(attrs \\ %{}) do
    %Airline{}
    |> Airline.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a airline.

  ## Examples

      iex> update_airline(airline, %{field: new_value})
      {:ok, %Airline{}}

      iex> update_airline(airline, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_airline(%Airline{} = airline, attrs) do
    airline
    |> Airline.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a airline.

  ## Examples

      iex> delete_airline(airline)
      {:ok, %Airline{}}

      iex> delete_airline(airline)
      {:error, %Ecto.Changeset{}}

  """
  def delete_airline(%Airline{} = airline) do
    Repo.delete(airline)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking airline changes.

  ## Examples

      iex> change_airline(airline)
      %Ecto.Changeset{data: %Airline{}}

  """
  def change_airline(%Airline{} = airline, attrs \\ %{}) do
    Airline.changeset(airline, attrs)
  end
end
