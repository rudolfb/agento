defmodule AgentoWeb.CommunicationTypeCodeController do
  use AgentoWeb, :controller

  alias Agento.Basedata.CommunicationContext
  alias Agento.Basedata.CommunicationContext.CommunicationTypeCode

  def index(conn, _params) do
    communication_type_codes = CommunicationContext.list_communication_type_codes()
    render(conn, "index.html", communication_type_codes: communication_type_codes)
  end

  def new(conn, _params) do
    changeset = CommunicationContext.change_communication_type_code(%CommunicationTypeCode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"communication_type_code" => communication_type_code_params}) do
    case CommunicationContext.create_communication_type_code(communication_type_code_params) do
      {:ok, communication_type_code} ->
        conn
        |> put_flash(:info, "Communication type code created successfully.")
        |> redirect(to: Routes.communication_type_code_path(conn, :show, communication_type_code))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    communication_type_code = CommunicationContext.get_communication_type_code!(id)
    render(conn, "show.html", communication_type_code: communication_type_code)
  end

  def edit(conn, %{"id" => id}) do
    communication_type_code = CommunicationContext.get_communication_type_code!(id)
    changeset = CommunicationContext.change_communication_type_code(communication_type_code)
    render(conn, "edit.html", communication_type_code: communication_type_code, changeset: changeset)
  end

  def update(conn, %{"id" => id, "communication_type_code" => communication_type_code_params}) do
    communication_type_code = CommunicationContext.get_communication_type_code!(id)

    case CommunicationContext.update_communication_type_code(communication_type_code, communication_type_code_params) do
      {:ok, communication_type_code} ->
        conn
        |> put_flash(:info, "Communication type code updated successfully.")
        |> redirect(to: Routes.communication_type_code_path(conn, :show, communication_type_code))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", communication_type_code: communication_type_code, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    communication_type_code = CommunicationContext.get_communication_type_code!(id)
    {:ok, _communication_type_code} = CommunicationContext.delete_communication_type_code(communication_type_code)

    conn
    |> put_flash(:info, "Communication type code deleted successfully.")
    |> redirect(to: Routes.communication_type_code_path(conn, :index))
  end
end
