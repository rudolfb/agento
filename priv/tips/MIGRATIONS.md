# Phoenix: Ecto migrations cheatsheet

## Creating

    $ mix ecto.gen.migration update_posts_table
      creating priv/repo/migrations/20160602085927_update_posts_table.exs
      ···

    $ mix ecto.migrate
    $ mix ecto.rollback

Creates a migration (no models).

## Creating context

    $ mix phx.gen.context Images Album albums title:string subtitle:string privacy:string

## Migration functions

### Creating tables

    create table(:documents) do
      add :title, :string
      add :title, :string, size: 40
      add :title, :string, default: "Hello"
      add :title, :string, default: fragment("now()")
      add :title, :string, null: false
      add :body, :text
      add :age, :integer
      add :price, :float
      add :price, :decimal, precision: 10, scale: 2
      add :published_at, :utc_datetime
      add :group_id, references(:groups)
      add :object, :json
      add :is_active, :boolean, default: true, null: false

      timestamps  # inserted_at and updated_at
    end

    create_if_not_exists table(:documents) do: ... end

### Other operations

    alter table(:posts) do
      add :summary, :text
      modify :title, :text
      remove :views
    end

    rename table(:posts), :title, to: :summary
    rename table(:posts), to: table(:new_posts)
    drop table(:documents)
    drop_if_exists table(:documents)
    table(:documents)
    table(:weather, prefix: :north_america)

### Indices

    create index(:posts, [:slug], concurrently: true)
    create unique_index(:posts, [:slug])
    drop index(:posts, [:name])

### Execute SQL

    execute "UPDATE posts SET published_at = NULL"
    execute create: "posts", capped: true, size: 1024

## References
[Ecto.Migration](https://hexdocs.pm/ecto_sql/Ecto.Migration.html#content)
