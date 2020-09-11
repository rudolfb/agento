defmodule AgentoWeb.AirportController do
  use AgentoWeb, :controller

  alias Agento.Basedata.AirportContext
  alias Agento.Basedata.AirportContext.Airport

  def index(conn, _params) do
    airports = AirportContext.list_airports()
    render(conn, "index.html", airports: airports)
  end

  def new(conn, _params) do
    changeset = AirportContext.change_airport(%Airport{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"airport" => airport_params}) do
    case AirportContext.create_airport(airport_params) do
      {:ok, airport} ->
        conn
        |> put_flash(:info, "Airport created successfully.")
        |> redirect(to: Routes.airport_path(conn, :show, airport))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    airport = AirportContext.get_airport!(id)
    render(conn, "show.html", airport: airport)
  end

  def edit(conn, %{"id" => id}) do
    airport = AirportContext.get_airport!(id)
    changeset = AirportContext.change_airport(airport)
    render(conn, "edit.html", airport: airport, changeset: changeset)
  end

  def update(conn, %{"id" => id, "airport" => airport_params}) do
    airport = AirportContext.get_airport!(id)

    case AirportContext.update_airport(airport, airport_params) do
      {:ok, airport} ->
        conn
        |> put_flash(:info, "Airport updated successfully.")
        |> redirect(to: Routes.airport_path(conn, :show, airport))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", airport: airport, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    airport = AirportContext.get_airport!(id)
    {:ok, _airport} = AirportContext.delete_airport(airport)

    conn
    |> put_flash(:info, "Airport deleted successfully.")
    |> redirect(to: Routes.airport_path(conn, :index))
  end
end
