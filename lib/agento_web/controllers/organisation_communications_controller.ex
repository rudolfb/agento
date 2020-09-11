defmodule AgentoWeb.OrganisationCommunicationsController do
  use AgentoWeb, :controller

  alias Agento.OrganisationContext
  alias Agento.OrganisationContext.OrganisationCommunications

  def index(conn, _params) do
    organisations_communications = OrganisationContext.list_organisations_communications()
    render(conn, "index.html", organisations_communications: organisations_communications)
  end

  def new(conn, _params) do
    changeset = OrganisationContext.change_organisation_communications(%OrganisationCommunications{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation_communications" => organisation_communications_params}) do
    case OrganisationContext.create_organisation_communications(organisation_communications_params) do
      {:ok, organisation_communications} ->
        conn
        |> put_flash(:info, "Organisation communications created successfully.")
        |> redirect(to: Routes.organisation_communications_path(conn, :show, organisation_communications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation_communications = OrganisationContext.get_organisation_communications!(id)
    render(conn, "show.html", organisation_communications: organisation_communications)
  end

  def edit(conn, %{"id" => id}) do
    organisation_communications = OrganisationContext.get_organisation_communications!(id)
    changeset = OrganisationContext.change_organisation_communications(organisation_communications)
    render(conn, "edit.html", organisation_communications: organisation_communications, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation_communications" => organisation_communications_params}) do
    organisation_communications = OrganisationContext.get_organisation_communications!(id)

    case OrganisationContext.update_organisation_communications(organisation_communications, organisation_communications_params) do
      {:ok, organisation_communications} ->
        conn
        |> put_flash(:info, "Organisation communications updated successfully.")
        |> redirect(to: Routes.organisation_communications_path(conn, :show, organisation_communications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation_communications: organisation_communications, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation_communications = OrganisationContext.get_organisation_communications!(id)
    {:ok, _organisation_communications} = OrganisationContext.delete_organisation_communications(organisation_communications)

    conn
    |> put_flash(:info, "Organisation communications deleted successfully.")
    |> redirect(to: Routes.organisation_communications_path(conn, :index))
  end
end
