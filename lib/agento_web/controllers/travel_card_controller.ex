defmodule AgentoWeb.TravelCardController do
  use AgentoWeb, :controller

  alias Agento.TravelCardContext
  alias Agento.TravelCardContext.TravelCard

  def index(conn, _params) do
    travelcards = TravelCardContext.list_travelcards()
    render(conn, "index.html", travelcards: travelcards)
  end

  def new(conn, _params) do
    changeset = TravelCardContext.change_travel_card(%TravelCard{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"travel_card" => travel_card_params}) do
    case TravelCardContext.create_travel_card(travel_card_params) do
      {:ok, travel_card} ->
        conn
        |> put_flash(:info, "Travel card created successfully.")
        |> redirect(to: Routes.travel_card_path(conn, :show, travel_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    travel_card = TravelCardContext.get_travel_card!(id)
    render(conn, "show.html", travel_card: travel_card)
  end

  def edit(conn, %{"id" => id}) do
    travel_card = TravelCardContext.get_travel_card!(id)
    changeset = TravelCardContext.change_travel_card(travel_card)
    render(conn, "edit.html", travel_card: travel_card, changeset: changeset)
  end

  def update(conn, %{"id" => id, "travel_card" => travel_card_params}) do
    travel_card = TravelCardContext.get_travel_card!(id)

    case TravelCardContext.update_travel_card(travel_card, travel_card_params) do
      {:ok, travel_card} ->
        conn
        |> put_flash(:info, "Travel card updated successfully.")
        |> redirect(to: Routes.travel_card_path(conn, :show, travel_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", travel_card: travel_card, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel_card = TravelCardContext.get_travel_card!(id)
    {:ok, _travel_card} = TravelCardContext.delete_travel_card(travel_card)

    conn
    |> put_flash(:info, "Travel card deleted successfully.")
    |> redirect(to: Routes.travel_card_path(conn, :index))
  end
end
