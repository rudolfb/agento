defmodule AgentoWeb.OrganisationAddressController do
  use AgentoWeb, :controller

  alias Agento.OrganisationContext
  alias Agento.OrganisationContext.OrganisationAddress

  def index(conn, _params) do
    organisations_addresses = OrganisationContext.list_organisations_addresses()
    render(conn, "index.html", organisations_addresses: organisations_addresses)
  end

  def new(conn, _params) do
    changeset = OrganisationContext.change_organisation_address(%OrganisationAddress{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation_address" => organisation_address_params}) do
    case OrganisationContext.create_organisation_address(organisation_address_params) do
      {:ok, organisation_address} ->
        conn
        |> put_flash(:info, "Organisation address created successfully.")
        |> redirect(to: Routes.organisation_address_path(conn, :show, organisation_address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation_address = OrganisationContext.get_organisation_address!(id)
    render(conn, "show.html", organisation_address: organisation_address)
  end

  def edit(conn, %{"id" => id}) do
    organisation_address = OrganisationContext.get_organisation_address!(id)
    changeset = OrganisationContext.change_organisation_address(organisation_address)
    render(conn, "edit.html", organisation_address: organisation_address, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation_address" => organisation_address_params}) do
    organisation_address = OrganisationContext.get_organisation_address!(id)

    case OrganisationContext.update_organisation_address(organisation_address, organisation_address_params) do
      {:ok, organisation_address} ->
        conn
        |> put_flash(:info, "Organisation address updated successfully.")
        |> redirect(to: Routes.organisation_address_path(conn, :show, organisation_address))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation_address: organisation_address, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation_address = OrganisationContext.get_organisation_address!(id)
    {:ok, _organisation_address} = OrganisationContext.delete_organisation_address(organisation_address)

    conn
    |> put_flash(:info, "Organisation address deleted successfully.")
    |> redirect(to: Routes.organisation_address_path(conn, :index))
  end
end
