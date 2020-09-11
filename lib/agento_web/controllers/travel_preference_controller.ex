defmodule AgentoWeb.TravelPreferenceController do
  use AgentoWeb, :controller

  alias Agento.IndividualContext
  alias Agento.IndividualContext.TravelPreference

  def index(conn, _params) do
    travelpreferences = IndividualContext.list_travelpreferences()
    render(conn, "index.html", travelpreferences: travelpreferences)
  end

  def new(conn, _params) do
    changeset = IndividualContext.change_travel_preference(%TravelPreference{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"travel_preference" => travel_preference_params}) do
    case IndividualContext.create_travel_preference(travel_preference_params) do
      {:ok, travel_preference} ->
        conn
        |> put_flash(:info, "Travel preference created successfully.")
        |> redirect(to: Routes.travel_preference_path(conn, :show, travel_preference))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    travel_preference = IndividualContext.get_travel_preference!(id)
    render(conn, "show.html", travel_preference: travel_preference)
  end

  def edit(conn, %{"id" => id}) do
    travel_preference = IndividualContext.get_travel_preference!(id)
    changeset = IndividualContext.change_travel_preference(travel_preference)
    render(conn, "edit.html", travel_preference: travel_preference, changeset: changeset)
  end

  def update(conn, %{"id" => id, "travel_preference" => travel_preference_params}) do
    travel_preference = IndividualContext.get_travel_preference!(id)

    case IndividualContext.update_travel_preference(travel_preference, travel_preference_params) do
      {:ok, travel_preference} ->
        conn
        |> put_flash(:info, "Travel preference updated successfully.")
        |> redirect(to: Routes.travel_preference_path(conn, :show, travel_preference))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", travel_preference: travel_preference, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel_preference = IndividualContext.get_travel_preference!(id)
    {:ok, _travel_preference} = IndividualContext.delete_travel_preference(travel_preference)

    conn
    |> put_flash(:info, "Travel preference deleted successfully.")
    |> redirect(to: Routes.travel_preference_path(conn, :index))
  end
end
