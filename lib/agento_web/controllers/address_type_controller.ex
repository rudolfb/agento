defmodule AgentoWeb.AddressTypeController do
  use AgentoWeb, :controller

  alias Agento.Basedata.AddressContext
  alias Agento.Basedata.AddressContext.AddressType

  def index(conn, _params) do
    addresstypes = AddressContext.list_addresstypes()
    render(conn, "index.html", addresstypes: addresstypes)
  end

  def new(conn, _params) do
    changeset = AddressContext.change_address_type(%AddressType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"address_type" => address_type_params}) do
    case AddressContext.create_address_type(address_type_params) do
      {:ok, address_type} ->
        conn
        |> put_flash(:info, "Address type created successfully.")
        |> redirect(to: Routes.address_type_path(conn, :show, address_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    address_type = AddressContext.get_address_type!(id)
    render(conn, "show.html", address_type: address_type)
  end

  def edit(conn, %{"id" => id}) do
    address_type = AddressContext.get_address_type!(id)
    changeset = AddressContext.change_address_type(address_type)
    render(conn, "edit.html", address_type: address_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "address_type" => address_type_params}) do
    address_type = AddressContext.get_address_type!(id)

    case AddressContext.update_address_type(address_type, address_type_params) do
      {:ok, address_type} ->
        conn
        |> put_flash(:info, "Address type updated successfully.")
        |> redirect(to: Routes.address_type_path(conn, :show, address_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", address_type: address_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    address_type = AddressContext.get_address_type!(id)
    {:ok, _address_type} = AddressContext.delete_address_type(address_type)

    conn
    |> put_flash(:info, "Address type deleted successfully.")
    |> redirect(to: Routes.address_type_path(conn, :index))
  end
end
