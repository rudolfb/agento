defmodule Agento.Basedata.RoleTypeContextTest do
  use Agento.DataCase

  alias Agento.Basedata.RoleTypeContext

  describe "roletypes" do
    alias Agento.Basedata.RoleTypeContext.RoleType

    @valid_attrs %{code: "some code"}
    @update_attrs %{code: "some updated code"}
    @invalid_attrs %{code: nil}

    def role_type_fixture(attrs \\ %{}) do
      {:ok, role_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RoleTypeContext.create_role_type()

      role_type
    end

    test "list_roletypes/0 returns all roletypes" do
      role_type = role_type_fixture()
      assert RoleTypeContext.list_roletypes() == [role_type]
    end

    test "get_role_type!/1 returns the role_type with given id" do
      role_type = role_type_fixture()
      assert RoleTypeContext.get_role_type!(role_type.id) == role_type
    end

    test "create_role_type/1 with valid data creates a role_type" do
      assert {:ok, %RoleType{} = role_type} = RoleTypeContext.create_role_type(@valid_attrs)
      assert role_type.code == "some code"
    end

    test "create_role_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RoleTypeContext.create_role_type(@invalid_attrs)
    end

    test "update_role_type/2 with valid data updates the role_type" do
      role_type = role_type_fixture()
      assert {:ok, %RoleType{} = role_type} = RoleTypeContext.update_role_type(role_type, @update_attrs)
      assert role_type.code == "some updated code"
    end

    test "update_role_type/2 with invalid data returns error changeset" do
      role_type = role_type_fixture()
      assert {:error, %Ecto.Changeset{}} = RoleTypeContext.update_role_type(role_type, @invalid_attrs)
      assert role_type == RoleTypeContext.get_role_type!(role_type.id)
    end

    test "delete_role_type/1 deletes the role_type" do
      role_type = role_type_fixture()
      assert {:ok, %RoleType{}} = RoleTypeContext.delete_role_type(role_type)
      assert_raise Ecto.NoResultsError, fn -> RoleTypeContext.get_role_type!(role_type.id) end
    end

    test "change_role_type/1 returns a role_type changeset" do
      role_type = role_type_fixture()
      assert %Ecto.Changeset{} = RoleTypeContext.change_role_type(role_type)
    end
  end
end
