defmodule AgentoWeb.RoleTypeController do
  use AgentoWeb, :controller

  alias Agento.Basedata.RoleTypeContext
  alias Agento.Basedata.RoleTypeContext.RoleType

  def index(conn, _params) do
    roletypes = RoleTypeContext.list_roletypes()
    render(conn, "index.html", roletypes: roletypes)
  end

  def new(conn, _params) do
    changeset = RoleTypeContext.change_role_type(%RoleType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role_type" => role_type_params}) do
    case RoleTypeContext.create_role_type(role_type_params) do
      {:ok, role_type} ->
        conn
        |> put_flash(:info, "Role type created successfully.")
        |> redirect(to: Routes.role_type_path(conn, :show, role_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    role_type = RoleTypeContext.get_role_type!(id)
    render(conn, "show.html", role_type: role_type)
  end

  def edit(conn, %{"id" => id}) do
    role_type = RoleTypeContext.get_role_type!(id)
    changeset = RoleTypeContext.change_role_type(role_type)
    render(conn, "edit.html", role_type: role_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role_type" => role_type_params}) do
    role_type = RoleTypeContext.get_role_type!(id)

    case RoleTypeContext.update_role_type(role_type, role_type_params) do
      {:ok, role_type} ->
        conn
        |> put_flash(:info, "Role type updated successfully.")
        |> redirect(to: Routes.role_type_path(conn, :show, role_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", role_type: role_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role_type = RoleTypeContext.get_role_type!(id)
    {:ok, _role_type} = RoleTypeContext.delete_role_type(role_type)

    conn
    |> put_flash(:info, "Role type deleted successfully.")
    |> redirect(to: Routes.role_type_path(conn, :index))
  end
end
