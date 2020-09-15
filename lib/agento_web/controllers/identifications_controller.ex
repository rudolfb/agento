defmodule AgentoWeb.IdentificationsController do
  use AgentoWeb, :controller

  alias Agento.IndividualIdentificationContext
  alias Agento.IndividualIdentificationContext.Identifications

  def index(conn, _params) do
    identification = IndividualIdentificationContext.list_identification()
    render(conn, "index.html", identification: identification)
  end

  def new(conn, _params) do
    changeset = IndividualIdentificationContext.change_identifications(%Identifications{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"identifications" => identifications_params}) do
    case IndividualIdentificationContext.create_identifications(identifications_params) do
      {:ok, identifications} ->
        conn
        |> put_flash(:info, "Identifications created successfully.")
        |> redirect(to: Routes.identifications_path(conn, :show, identifications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    identifications = IndividualIdentificationContext.get_identifications!(id)
    render(conn, "show.html", identifications: identifications)
  end

  def edit(conn, %{"id" => id}) do
    identifications = IndividualIdentificationContext.get_identifications!(id)
    changeset = IndividualIdentificationContext.change_identifications(identifications)
    render(conn, "edit.html", identifications: identifications, changeset: changeset)
  end

  def update(conn, %{"id" => id, "identifications" => identifications_params}) do
    identifications = IndividualIdentificationContext.get_identifications!(id)

    case IndividualIdentificationContext.update_identifications(identifications, identifications_params) do
      {:ok, identifications} ->
        conn
        |> put_flash(:info, "Identifications updated successfully.")
        |> redirect(to: Routes.identifications_path(conn, :show, identifications))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", identifications: identifications, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    identifications = IndividualIdentificationContext.get_identifications!(id)
    {:ok, _identifications} = IndividualIdentificationContext.delete_identifications(identifications)

    conn
    |> put_flash(:info, "Identifications deleted successfully.")
    |> redirect(to: Routes.identifications_path(conn, :index))
  end
end
