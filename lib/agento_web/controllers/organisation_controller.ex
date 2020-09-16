defmodule AgentoWeb.OrganisationController do
  use AgentoWeb, :controller

  alias Agento.OrganisationContext
  alias Agento.OrganisationContext.Organisation

  def index(conn, _params) do
    organisations = OrganisationContext.list_organisations()
    render(conn, "index.html", organisations: organisations)
  end

  def new(conn, _params) do
    changeset = OrganisationContext.change_organisation(%Organisation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation" => organisation_params}) do
    case OrganisationContext.create_organisation(organisation_params) do
      {:ok, organisation} ->
        conn
        |> put_flash(:info, "Organisation created successfully.")
        |> redirect(to: Routes.organisation_path(conn, :show, organisation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation = OrganisationContext.get_organisation!(id)
    render(conn, "show.html", organisation: organisation)
  end

  def edit(conn, %{"id" => id}) do
    organisation = OrganisationContext.get_organisation!(id)
    changeset = OrganisationContext.change_organisation(organisation)
    render(conn, "edit.html", organisation: organisation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation" => organisation_params}) do
    organisation = OrganisationContext.get_organisation!(id)

    case OrganisationContext.update_organisation(organisation, organisation_params) do
      {:ok, organisation} ->
        conn
        |> put_flash(:info, "Organisation updated successfully.")
        |> redirect(to: Routes.organisation_path(conn, :show, organisation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation: organisation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation = OrganisationContext.get_organisation!(id)
    {:ok, _organisation} = OrganisationContext.delete_organisation(organisation)

    conn
    |> put_flash(:info, "Organisation deleted successfully.")
    |> redirect(to: Routes.organisation_path(conn, :index))
  end
end
