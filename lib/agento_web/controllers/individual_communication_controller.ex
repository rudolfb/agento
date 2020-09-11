defmodule AgentoWeb.IndividualCommunicationController do
  use AgentoWeb, :controller

  alias Agento.IndividualContext
  alias Agento.IndividualContext.IndividualCommunication

  def index(conn, _params) do
    individuals_communications = IndividualContext.list_individuals_communications()
    render(conn, "index.html", individuals_communications: individuals_communications)
  end

  def new(conn, _params) do
    changeset = IndividualContext.change_individual_communication(%IndividualCommunication{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"individual_communication" => individual_communication_params}) do
    case IndividualContext.create_individual_communication(individual_communication_params) do
      {:ok, individual_communication} ->
        conn
        |> put_flash(:info, "Individual communication created successfully.")
        |> redirect(to: Routes.individual_communication_path(conn, :show, individual_communication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    individual_communication = IndividualContext.get_individual_communication!(id)
    render(conn, "show.html", individual_communication: individual_communication)
  end

  def edit(conn, %{"id" => id}) do
    individual_communication = IndividualContext.get_individual_communication!(id)
    changeset = IndividualContext.change_individual_communication(individual_communication)
    render(conn, "edit.html", individual_communication: individual_communication, changeset: changeset)
  end

  def update(conn, %{"id" => id, "individual_communication" => individual_communication_params}) do
    individual_communication = IndividualContext.get_individual_communication!(id)

    case IndividualContext.update_individual_communication(individual_communication, individual_communication_params) do
      {:ok, individual_communication} ->
        conn
        |> put_flash(:info, "Individual communication updated successfully.")
        |> redirect(to: Routes.individual_communication_path(conn, :show, individual_communication))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", individual_communication: individual_communication, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    individual_communication = IndividualContext.get_individual_communication!(id)
    {:ok, _individual_communication} = IndividualContext.delete_individual_communication(individual_communication)

    conn
    |> put_flash(:info, "Individual communication deleted successfully.")
    |> redirect(to: Routes.individual_communication_path(conn, :index))
  end
end
