defmodule AgentoWeb.IndividualAddressController do
  use AgentoWeb, :controller

  alias Agento.IndividualAddressContext
  alias Agento.IndividualAddressContext.IndividualAddress

  def index(conn, _params) do
    individuals_addresses = IndividualAddressContext.list_individuals_addresses()
    render(conn, "index.html", individuals_addresses: individuals_addresses)
  end

  def new(conn, _params) do
    changeset = IndividualAddressContext.change_individual_address(%IndividualAddress{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"individual_address" => individual_address_params}) do
    case IndividualAddressContext.create_individual_address(individual_address_params) do
      {:ok, individual_address} ->
        conn
        |> put_flash(:info, "Individual address created successfully.")
        |> redirect(to: Routes.individual_address_path(conn, :show, individual_address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    individual_address = IndividualAddressContext.get_individual_address!(id)
    render(conn, "show.html", individual_address: individual_address)
  end

  def edit(conn, %{"id" => id}) do
    individual_address = IndividualAddressContext.get_individual_address!(id)
    changeset = IndividualAddressContext.change_individual_address(individual_address)
    render(conn, "edit.html", individual_address: individual_address, changeset: changeset)
  end

  def update(conn, %{"id" => id, "individual_address" => individual_address_params}) do
    individual_address = IndividualAddressContext.get_individual_address!(id)

    case IndividualAddressContext.update_individual_address(individual_address, individual_address_params) do
      {:ok, individual_address} ->
        conn
        |> put_flash(:info, "Individual address updated successfully.")
        |> redirect(to: Routes.individual_address_path(conn, :show, individual_address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", individual_address: individual_address, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    individual_address = IndividualAddressContext.get_individual_address!(id)
    {:ok, _individual_address} = IndividualAddressContext.delete_individual_address(individual_address)

    conn
    |> put_flash(:info, "Individual address deleted successfully.")
    |> redirect(to: Routes.individual_address_path(conn, :index))
  end
end
