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




mix phx.gen.html CountryContext Country countries alpha2:string alpha3:string numeric3:string name:string
mix phx.gen.html CurrencyContext Currency currencies code:string name:string is_fund:boolean is_complimentary:boolean is_metal:boolean

mix phx.gen.html AirportContext Airport airports country_id:references:countries region_name:string iata:string icao:string airport:string latitude:float longitude:float

mix phx.gen.html IndividualContext FrequentFlyerCard frequentflyercards has_wheelchair:boolean home_airport_id:references:airports labelname:string mealtypecode:string PreferredAircraftSeatTypeCode:string

mix phx.gen.html LanguageContext Language languages code3:string bcode:string tcode:string code2:string language_name:string scope:string type:string macro_language_code:string macro_language_name:string is_child:boolean is_correspondance_language:boolean sort_order:integer is_correspondance_language_active:boolean is_visible:boolean

mix phx.gen.html AddressContext AddressType addresstypes code:string
mix phx.gen.html AddressContext Address addresses street1:string street2:string city:string zipcode:string state:string pobox:string is_pobox:boolean country_id:references:countries begindate:datetime enddate:datetime active:boolean addresstype_id:references:addresstypes

mix phx.gen.html OrganisationContext Organisation organisations name:string abbreviation:string foundationdate:date begindate:datetime correspondancelanguage1_id:references:languages description:string enddate:datetime is_deleted:boolean popularname:string

mix phx.gen.html OrganisationContext OrganisationNameTrans organisation_name_trans name:string language:references:languages organisation_id:references:organisations

mix phx.gen.html OrganisationContext OrganisationAddress organisations_addresses organisation_id:references:organisations address_id:references:addresses

mix phx.gen.html IndividualContext Individual individuals lastname:string firstname:string gender:string native_language_code:string birthdate:date correspondancelanguage1_id:references:languages  dateofdeath:date displayname:string is_deleted:boolean nationalitycountrycode_id:references:countries

mix phx.gen.html IndividualContext IndividualAddress individuals_addresses individual_id:references:individuals address_id:references:addresses

mix phx.gen.html CommunicationTypeCodesContext CommunicationTypeCode communication_type_codes code:string

mix phx.gen.html CommunicationContext Communication communications value:string typecode:string communication_type_code_id:references:communication_type_codes

mix phx.gen.html OrganisationContext OrganisationCommunications organisations_communications organisation_id:references:organisations communication_id:references:communications
mix phx.gen.html IndividualContext IndividualCommunication individuals_communications individual_id:references:individuals communication_id:references:communications


mix phx.gen.html IndividualContext TravelPreference travelpreferences HasWheelchair:boolean homeairportlocation:string LabelName:string MealTypeCode:string PreferredAircraftSeatTypeCode:string


