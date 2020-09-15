defmodule AgentoWeb.OrganisationCommunicationsController do
  use AgentoWeb, :controller

  alias Agento.OrganisationCommunicationContext
  alias Agento.OrganisationCommunicationContext.OrganisationCommunications

  def index(conn, _params) do
    organisations_communications = OrganisationCommunicationContext.list_organisations_communications()
    render(conn, "index.html", organisations_communications: organisations_communications)
  end

  def new(conn, _params) do
    changeset = OrganisationCommunicationContext.change_organisation_communications(%OrganisationCommunications{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation_communications" => organisation_communications_params}) do
    case OrganisationCommunicationContext.create_organisation_communications(organisation_communications_params) do
      {:ok, organisation_communications} ->
        conn
        |> put_flash(:info, "Organisation communications created successfully.")
        |> redirect(to: Routes.organisation_communications_path(conn, :show, organisation_communications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation_communications = OrganisationCommunicationContext.get_organisation_communications!(id)
    render(conn, "show.html", organisation_communications: organisation_communications)
  end

  def edit(conn, %{"id" => id}) do
    organisation_communications = OrganisationCommunicationContext.get_organisation_communications!(id)
    changeset = OrganisationCommunicationContext.change_organisation_communications(organisation_communications)
    render(conn, "edit.html", organisation_communications: organisation_communications, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation_communications" => organisation_communications_params}) do
    organisation_communications = OrganisationCommunicationContext.get_organisation_communications!(id)

    case OrganisationCommunicationContext.update_organisation_communications(organisation_communications, organisation_communications_params) do
      {:ok, organisation_communications} ->
        conn
        |> put_flash(:info, "Organisation communications updated successfully.")
        |> redirect(to: Routes.organisation_communications_path(conn, :show, organisation_communications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation_communications: organisation_communications, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation_communications = OrganisationCommunicationContext.get_organisation_communications!(id)
    {:ok, _organisation_communications} = OrganisationCommunicationContext.delete_organisation_communications(organisation_communications)

    conn
    |> put_flash(:info, "Organisation communications deleted successfully.")
    |> redirect(to: Routes.organisation_communications_path(conn, :index))
  end
end
