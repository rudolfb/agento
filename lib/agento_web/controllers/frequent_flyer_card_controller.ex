defmodule AgentoWeb.FrequentFlyerCardController do
  use AgentoWeb, :controller

  alias Agento.TravelPreferenceContext
  alias Agento.TravelPreferenceContext.FrequentFlyerCard

  def index(conn, _params) do
    frequentflyercards = TravelPreferenceContext.list_frequentflyercards()
    render(conn, "index.html", frequentflyercards: frequentflyercards)
  end

  def new(conn, _params) do
    changeset = TravelPreferenceContext.change_frequent_flyer_card(%FrequentFlyerCard{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"frequent_flyer_card" => frequent_flyer_card_params}) do
    case TravelPreferenceContext.create_frequent_flyer_card(frequent_flyer_card_params) do
      {:ok, frequent_flyer_card} ->
        conn
        |> put_flash(:info, "Frequent flyer card created successfully.")
        |> redirect(to: Routes.frequent_flyer_card_path(conn, :show, frequent_flyer_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frequent_flyer_card = TravelPreferenceContext.get_frequent_flyer_card!(id)
    render(conn, "show.html", frequent_flyer_card: frequent_flyer_card)
  end

  def edit(conn, %{"id" => id}) do
    frequent_flyer_card = TravelPreferenceContext.get_frequent_flyer_card!(id)
    changeset = TravelPreferenceContext.change_frequent_flyer_card(frequent_flyer_card)
    render(conn, "edit.html", frequent_flyer_card: frequent_flyer_card, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frequent_flyer_card" => frequent_flyer_card_params}) do
    frequent_flyer_card = TravelPreferenceContext.get_frequent_flyer_card!(id)

    case TravelPreferenceContext.update_frequent_flyer_card(frequent_flyer_card, frequent_flyer_card_params) do
      {:ok, frequent_flyer_card} ->
        conn
        |> put_flash(:info, "Frequent flyer card updated successfully.")
        |> redirect(to: Routes.frequent_flyer_card_path(conn, :show, frequent_flyer_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", frequent_flyer_card: frequent_flyer_card, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frequent_flyer_card = TravelPreferenceContext.get_frequent_flyer_card!(id)
    {:ok, _frequent_flyer_card} = TravelPreferenceContext.delete_frequent_flyer_card(frequent_flyer_card)

    conn
    |> put_flash(:info, "Frequent flyer card deleted successfully.")
    |> redirect(to: Routes.frequent_flyer_card_path(conn, :index))
  end
end
