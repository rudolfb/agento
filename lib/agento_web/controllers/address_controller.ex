defmodule AgentoWeb.AddressController do
  use AgentoWeb, :controller

  alias Agento.AddressContext
  alias Agento.AddressContext.Address

  def index(conn, _params) do
    addresses = AddressContext.list_addresses()
    render(conn, "index.html", addresses: addresses)
  end

  def new(conn, _params) do
    changeset = AddressContext.change_address(%Address{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"address" => address_params}) do
    case AddressContext.create_address(address_params) do
      {:ok, address} ->
        conn
        |> put_flash(:info, "Address created successfully.")
        |> redirect(to: Routes.address_path(conn, :show, address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    address = AddressContext.get_address!(id)
    render(conn, "show.html", address: address)
  end

  def edit(conn, %{"id" => id}) do
    address = AddressContext.get_address!(id)
    changeset = AddressContext.change_address(address)
    render(conn, "edit.html", address: address, changeset: changeset)
  end

  def update(conn, %{"id" => id, "address" => address_params}) do
    address = AddressContext.get_address!(id)

    case AddressContext.update_address(address, address_params) do
      {:ok, address} ->
        conn
        |> put_flash(:info, "Address updated successfully.")
        |> redirect(to: Routes.address_path(conn, :show, address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", address: address, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    address = AddressContext.get_address!(id)
    {:ok, _address} = AddressContext.delete_address(address)

    conn
    |> put_flash(:info, "Address deleted successfully.")
    |> redirect(to: Routes.address_path(conn, :index))
  end
end
