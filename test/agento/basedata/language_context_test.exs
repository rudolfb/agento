defmodule Agento.Basedata.LanguageContextTest do
  use Agento.DataCase

  alias Agento.Basedata.LanguageContext

  describe "languages" do
    alias Agento.Basedata.LanguageContext.Language

    @valid_attrs %{bcode: "some bcode", code2: "some code2", code3: "some code3", is_child: true, is_correspondance_language: true, is_correspondance_language_active: true, is_visible: true, language_name: "some language_name", macro_language_code: "some macro_language_code", macro_language_name: "some macro_language_name", scope: "some scope", sort_order: 42, tcode: "some tcode", type: "some type"}
    @update_attrs %{bcode: "some updated bcode", code2: "some updated code2", code3: "some updated code3", is_child: false, is_correspondance_language: false, is_correspondance_language_active: false, is_visible: false, language_name: "some updated language_name", macro_language_code: "some updated macro_language_code", macro_language_name: "some updated macro_language_name", scope: "some updated scope", sort_order: 43, tcode: "some updated tcode", type: "some updated type"}
    @invalid_attrs %{bcode: nil, code2: nil, code3: nil, is_child: nil, is_correspondance_language: nil, is_correspondance_language_active: nil, is_visible: nil, language_name: nil, macro_language_code: nil, macro_language_name: nil, scope: nil, sort_order: nil, tcode: nil, type: nil}

    def language_fixture(attrs \\ %{}) do
      {:ok, language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> LanguageContext.create_language()

      language
    end

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert LanguageContext.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert LanguageContext.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      assert {:ok, %Language{} = language} = LanguageContext.create_language(@valid_attrs)
      assert language.bcode == "some bcode"
      assert language.code2 == "some code2"
      assert language.code3 == "some code3"
      assert language.is_child == true
      assert language.is_correspondance_language == true
      assert language.is_correspondance_language_active == true
      assert language.is_visible == true
      assert language.language_name == "some language_name"
      assert language.macro_language_code == "some macro_language_code"
      assert language.macro_language_name == "some macro_language_name"
      assert language.scope == "some scope"
      assert language.sort_order == 42
      assert language.tcode == "some tcode"
      assert language.type == "some type"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LanguageContext.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      assert {:ok, %Language{} = language} = LanguageContext.update_language(language, @update_attrs)
      assert language.bcode == "some updated bcode"
      assert language.code2 == "some updated code2"
      assert language.code3 == "some updated code3"
      assert language.is_child == false
      assert language.is_correspondance_language == false
      assert language.is_correspondance_language_active == false
      assert language.is_visible == false
      assert language.language_name == "some updated language_name"
      assert language.macro_language_code == "some updated macro_language_code"
      assert language.macro_language_name == "some updated macro_language_name"
      assert language.scope == "some updated scope"
      assert language.sort_order == 43
      assert language.tcode == "some updated tcode"
      assert language.type == "some updated type"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = LanguageContext.update_language(language, @invalid_attrs)
      assert language == LanguageContext.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = LanguageContext.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> LanguageContext.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = LanguageContext.change_language(language)
    end
  end
end
