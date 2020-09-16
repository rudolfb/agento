defmodule AgentoWeb.CommunicationController do
  use AgentoWeb, :controller

  alias Agento.CommunicationContext
  alias Agento.CommunicationContext.Communication

  def index(conn, _params) do
    communications = CommunicationContext.list_communications()
    render(conn, "index.html", communications: communications)
  end

  def new(conn, _params) do
    changeset = CommunicationContext.change_communication(%Communication{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"communication" => communication_params}) do
    case CommunicationContext.create_communication(communication_params) do
      {:ok, communication} ->
        conn
        |> put_flash(:info, "Communication created successfully.")
        |> redirect(to: Routes.communication_path(conn, :show, communication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    communication = CommunicationContext.get_communication!(id)
    render(conn, "show.html", communication: communication)
  end

  def edit(conn, %{"id" => id}) do
    communication = CommunicationContext.get_communication!(id)
    changeset = CommunicationContext.change_communication(communication)
    render(conn, "edit.html", communication: communication, changeset: changeset)
  end

  def update(conn, %{"id" => id, "communication" => communication_params}) do
    communication = CommunicationContext.get_communication!(id)

    case CommunicationContext.update_communication(communication, communication_params) do
      {:ok, communication} ->
        conn
        |> put_flash(:info, "Communication updated successfully.")
        |> redirect(to: Routes.communication_path(conn, :show, communication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", communication: communication, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    communication = CommunicationContext.get_communication!(id)
    {:ok, _communication} = CommunicationContext.delete_communication(communication)

    conn
    |> put_flash(:info, "Communication deleted successfully.")
    |> redirect(to: Routes.communication_path(conn, :index))
  end
end
