defmodule AgentoWeb.IdentificationTypeCodeController do
  use AgentoWeb, :controller

  alias Agento.Basedata.IdentificationTypeCodeContext
  alias Agento.Basedata.IdentificationTypeCodeContext.IdentificationTypeCode

  def index(conn, _params) do
    identificationtypecodes = IdentificationTypeCodeContext.list_identificationtypecodes()
    render(conn, "index.html", identificationtypecodes: identificationtypecodes)
  end

  def new(conn, _params) do
    changeset = IdentificationTypeCodeContext.change_identification_type_code(%IdentificationTypeCode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"identification_type_code" => identification_type_code_params}) do
    case IdentificationTypeCodeContext.create_identification_type_code(identification_type_code_params) do
      {:ok, identification_type_code} ->
        conn
        |> put_flash(:info, "Identification type code created successfully.")
        |> redirect(to: Routes.identification_type_code_path(conn, :show, identification_type_code))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    identification_type_code = IdentificationTypeCodeContext.get_identification_type_code!(id)
    render(conn, "show.html", identification_type_code: identification_type_code)
  end

  def edit(conn, %{"id" => id}) do
    identification_type_code = IdentificationTypeCodeContext.get_identification_type_code!(id)
    changeset = IdentificationTypeCodeContext.change_identification_type_code(identification_type_code)
    render(conn, "edit.html", identification_type_code: identification_type_code, changeset: changeset)
  end

  def update(conn, %{"id" => id, "identification_type_code" => identification_type_code_params}) do
    identification_type_code = IdentificationTypeCodeContext.get_identification_type_code!(id)

    case IdentificationTypeCodeContext.update_identification_type_code(identification_type_code, identification_type_code_params) do
      {:ok, identification_type_code} ->
        conn
        |> put_flash(:info, "Identification type code updated successfully.")
        |> redirect(to: Routes.identification_type_code_path(conn, :show, identification_type_code))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", identification_type_code: identification_type_code, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    identification_type_code = IdentificationTypeCodeContext.get_identification_type_code!(id)
    {:ok, _identification_type_code} = IdentificationTypeCodeContext.delete_identification_type_code(identification_type_code)

    conn
    |> put_flash(:info, "Identification type code deleted successfully.")
    |> redirect(to: Routes.identification_type_code_path(conn, :index))
  end
end
