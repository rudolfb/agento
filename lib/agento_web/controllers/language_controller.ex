defmodule AgentoWeb.LanguageController do
  use AgentoWeb, :controller

  alias Agento.Basedata.LanguageContext
  alias Agento.Basedata.LanguageContext.Language

  def index(conn, _params) do
    languages = LanguageContext.list_languages()
    render(conn, "index.html", languages: languages)
  end

  def new(conn, _params) do
    changeset = LanguageContext.change_language(%Language{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"language" => language_params}) do
    case LanguageContext.create_language(language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language created successfully.")
        |> redirect(to: Routes.language_path(conn, :show, language))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    language = LanguageContext.get_language!(id)
    render(conn, "show.html", language: language)
  end

  def edit(conn, %{"id" => id}) do
    language = LanguageContext.get_language!(id)
    changeset = LanguageContext.change_language(language)
    render(conn, "edit.html", language: language, changeset: changeset)
  end

  def update(conn, %{"id" => id, "language" => language_params}) do
    language = LanguageContext.get_language!(id)

    case LanguageContext.update_language(language, language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language updated successfully.")
        |> redirect(to: Routes.language_path(conn, :show, language))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", language: language, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    language = LanguageContext.get_language!(id)
    {:ok, _language} = LanguageContext.delete_language(language)

    conn
    |> put_flash(:info, "Language deleted successfully.")
    |> redirect(to: Routes.language_path(conn, :index))
  end
end
