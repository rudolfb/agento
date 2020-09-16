defmodule AgentoWeb.IndividualController do
  use AgentoWeb, :controller

  alias Agento.IndividualContext
  alias Agento.IndividualContext.Individual

  def index(conn, _params) do
    individuals = IndividualContext.list_individuals()
    render(conn, "index.html", individuals: individuals)
  end

  def new(conn, _params) do
    changeset = IndividualContext.change_individual(%Individual{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"individual" => individual_params}) do
    case IndividualContext.create_individual(individual_params) do
      {:ok, individual} ->
        conn
        |> put_flash(:info, "Individual created successfully.")
        |> redirect(to: Routes.individual_path(conn, :show, individual))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    individual = IndividualContext.get_individual!(id)
    render(conn, "show.html", individual: individual)
  end

  def edit(conn, %{"id" => id}) do
    individual = IndividualContext.get_individual!(id)
    changeset = IndividualContext.change_individual(individual)
    render(conn, "edit.html", individual: individual, changeset: changeset)
  end

  def update(conn, %{"id" => id, "individual" => individual_params}) do
    individual = IndividualContext.get_individual!(id)

    case IndividualContext.update_individual(individual, individual_params) do
      {:ok, individual} ->
        conn
        |> put_flash(:info, "Individual updated successfully.")
        |> redirect(to: Routes.individual_path(conn, :show, individual))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", individual: individual, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    individual = IndividualContext.get_individual!(id)
    {:ok, _individual} = IndividualContext.delete_individual(individual)

    conn
    |> put_flash(:info, "Individual deleted successfully.")
    |> redirect(to: Routes.individual_path(conn, :index))
  end
end
