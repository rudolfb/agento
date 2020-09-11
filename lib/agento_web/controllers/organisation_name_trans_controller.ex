defmodule AgentoWeb.OrganisationNameTransController do
  use AgentoWeb, :controller

  alias Agento.OrganisationContext
  alias Agento.OrganisationContext.OrganisationNameTrans

  def index(conn, _params) do
    organisation_name_trans = OrganisationContext.list_organisation_name_trans()
    render(conn, "index.html", organisation_name_trans: organisation_name_trans)
  end

  def new(conn, _params) do
    changeset = OrganisationContext.change_organisation_name_trans(%OrganisationNameTrans{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organisation_name_trans" => organisation_name_trans_params}) do
    case OrganisationContext.create_organisation_name_trans(organisation_name_trans_params) do
      {:ok, organisation_name_trans} ->
        conn
        |> put_flash(:info, "Organisation name trans created successfully.")
        |> redirect(to: Routes.organisation_name_trans_path(conn, :show, organisation_name_trans))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organisation_name_trans = OrganisationContext.get_organisation_name_trans!(id)
    render(conn, "show.html", organisation_name_trans: organisation_name_trans)
  end

  def edit(conn, %{"id" => id}) do
    organisation_name_trans = OrganisationContext.get_organisation_name_trans!(id)
    changeset = OrganisationContext.change_organisation_name_trans(organisation_name_trans)
    render(conn, "edit.html", organisation_name_trans: organisation_name_trans, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organisation_name_trans" => organisation_name_trans_params}) do
    organisation_name_trans = OrganisationContext.get_organisation_name_trans!(id)

    case OrganisationContext.update_organisation_name_trans(organisation_name_trans, organisation_name_trans_params) do
      {:ok, organisation_name_trans} ->
        conn
        |> put_flash(:info, "Organisation name trans updated successfully.")
        |> redirect(to: Routes.organisation_name_trans_path(conn, :show, organisation_name_trans))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", organisation_name_trans: organisation_name_trans, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organisation_name_trans = OrganisationContext.get_organisation_name_trans!(id)
    {:ok, _organisation_name_trans} = OrganisationContext.delete_organisation_name_trans(organisation_name_trans)

    conn
    |> put_flash(:info, "Organisation name trans deleted successfully.")
    |> redirect(to: Routes.organisation_name_trans_path(conn, :index))
  end
end
