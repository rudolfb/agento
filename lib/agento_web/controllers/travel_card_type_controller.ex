defmodule AgentoWeb.TravelCardTypeController do
  use AgentoWeb, :controller

  alias Agento.Basedata.TravelCardTypeContext
  alias Agento.Basedata.TravelCardTypeContext.TravelCardType

  def index(conn, _params) do
    travelcardtypes = TravelCardTypeContext.list_travelcardtypes()
    render(conn, "index.html", travelcardtypes: travelcardtypes)
  end

  def new(conn, _params) do
    changeset = TravelCardTypeContext.change_travel_card_type(%TravelCardType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"travel_card_type" => travel_card_type_params}) do
    case TravelCardTypeContext.create_travel_card_type(travel_card_type_params) do
      {:ok, travel_card_type} ->
        conn
        |> put_flash(:info, "Travel card type created successfully.")
        |> redirect(to: Routes.travel_card_type_path(conn, :show, travel_card_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    travel_card_type = TravelCardTypeContext.get_travel_card_type!(id)
    render(conn, "show.html", travel_card_type: travel_card_type)
  end

  def edit(conn, %{"id" => id}) do
    travel_card_type = TravelCardTypeContext.get_travel_card_type!(id)
    changeset = TravelCardTypeContext.change_travel_card_type(travel_card_type)
    render(conn, "edit.html", travel_card_type: travel_card_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "travel_card_type" => travel_card_type_params}) do
    travel_card_type = TravelCardTypeContext.get_travel_card_type!(id)

    case TravelCardTypeContext.update_travel_card_type(travel_card_type, travel_card_type_params) do
      {:ok, travel_card_type} ->
        conn
        |> put_flash(:info, "Travel card type updated successfully.")
        |> redirect(to: Routes.travel_card_type_path(conn, :show, travel_card_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", travel_card_type: travel_card_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel_card_type = TravelCardTypeContext.get_travel_card_type!(id)
    {:ok, _travel_card_type} = TravelCardTypeContext.delete_travel_card_type(travel_card_type)

    conn
    |> put_flash(:info, "Travel card type deleted successfully.")
    |> redirect(to: Routes.travel_card_type_path(conn, :index))
  end
end
