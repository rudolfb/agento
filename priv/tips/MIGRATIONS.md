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

CommunicationType: TELP,TELB,MTEL,EML,FAXP,FAXB,EML2,EML3
AddressType: BUS, PRV
RoleTypeCode: ADM (Administrator), ADV (Advisor), AGS (Acting General Secretary), AMA (Administration Manager), APO (Assistant Press Officer), ARO (Assistant Relation Officer), ASM (Associate Member), AST (Assistant), CDO (Chief Officer of Division), CEO (Chief Executive Officer), CHM (Chairman), CHW (Chairwoman), COA (Coach), COD (Director of Communications & Public Affairs), COF (FIFA General Coordinator), COFA (FIFA General Coordinator Assistant), CON (Consultant), COR (Co-ordinator), DCH (Deputy chairman), DCHW (Deputy chairwoman), DDIR (Deputy Director), DGS (Deputy General Secretary), DHD (Department Head), DIR (Director), DPRE (Deputy President), DSG (Deputy Secretary General), FIN (Finance), FINDIR (Director of Finance and Administration), FINM (Finance manager), GCOM (Companion), GRL (Group Leader), GSE (General Secretary), GSEA (Assistant to Secretary General), GSES (Secretary General), GSESA (Assistant Secretary General), HOA (Head of Administration), HOD (Head of Delegation), HPR (Honorary President), HRM (Human resources manager), HVP (Honorary Vice-President), INTM (International relations manager), ITM (IT manager), ITS (IT Support), LGDIR (Director of Legal Affairs), LGL (Legal), LGLM (Legal manager), LGRE (League representative), MCM (Media/Communications Manager), MCM2 (Media/Communications Manager 2), MNG (Manager), MRK (Marketing), MRKTVM (Marketing/TV manager), NSO (National Security Officer), OFN (Other Function), PR2 (Second President), PRE (President), PREA (Assistant to the President), PROJM (Project Management), SPAD (Special adviser), STU (Student), SVP (Senior Vice-President), TAM (Team Administrator), TAS (Technical Assistant), TDIR (Technical Director), TDVO (Technical Development Officer), TEA (Technical Adviser), TG1 (Testguppe), TMP (Temporary), TRA (Trainee), TRE (Treasurer), TSUP (Technical Support), VCHM (Vice-Chairman), VP (Vice-President), VP2 (Second Vice-President), VP3 (Third Vice-President), VP4 (Fourth Vice President), XDIR (Executive Director)

SELECT distinct RTP_ROLETYPE_CDE,ROLETYPE_CDE_DESCR
FROM FIFA_INDROLE


mix phx.gen.html Basedata.CountryContext Country countries alpha2:string alpha3:string numeric3:string name:string
mix phx.gen.html Basedata.CurrencyContext Currency currencies code:string name:string is_fund:boolean is_complimentary:boolean is_metal:boolean
mix phx.gen.html Basedata.AirportContext Airport airports country_id:references:countries region_name:string iata:string icao:string airport:string latitude:float longitude:float
mix phx.gen.html Basedata.LanguageContext Language languages code3:string bcode:string tcode:string code2:string language_name:string scope:string type:string macro_language_code:string macro_language_name:string is_child:boolean is_correspondance_language:boolean sort_order:integer is_correspondance_language_active:boolean is_visible:boolean
mix phx.gen.html Basedata.CommunicationContext CommunicationTypeCode communication_type_codes code:string
mix phx.gen.html Basedata.AirlineContext Airline airlines id_nr:string name:string alias:string iata:string icao:string callsign:string country_name:string active:boolean
mix phx.gen.html Basedata.TravelPreferenceContext TravelCardType travelcardtypes name:string
mix phx.gen.html Basedata.IdentificationTypeCodeContext IdentificationTypeCode identificationtypecodes name:string
mix phx.gen.html Basedata.AddressContext AddressType addresstypes code:string
mix phx.gen.html Basedata.RoleContext RoleType roletypes code:string

mix phx.gen.html AddressContext Address addresses street1:string street2:string city:string zipcode:string state:string pobox:string is_pobox:boolean country_id:references:countries begindate:datetime enddate:datetime active:boolean addresstype_id:references:addresstypes

mix phx.gen.html OrganisationContext Organisation organisations name:string abbreviation:string foundationdate:date begindate:datetime correspondancelanguage1_id:references:languages description:string enddate:datetime is_deleted:boolean popularname:string
mix phx.gen.html OrganisationContext OrganisationNameTrans organisation_name_trans name:string language:references:languages organisation_id:references:organisations
mix phx.gen.html OrganisationAddressContext OrganisationAddress organisations_addresses organisation_id:references:organisations address_id:references:addresses

mix phx.gen.html IndividualContext Individual individuals lastname:string firstname:string gender:string native_language_code:string birthdate:date correspondancelanguage1_id:references:languages  dateofdeath:date displayname:string is_deleted:boolean nationalitycountrycode_id:references:countries

mix phx.gen.html IndividualAddressContext IndividualAddress individuals_addresses individual_id:references:individuals address_id:references:addresses

mix phx.gen.html CommunicationContext Communication communications value:string typecode:string communication_type_code_id:references:communication_type_codes

mix phx.gen.html OrganisationCommunicationContext OrganisationCommunications organisations_communications organisation_id:references:organisations communication_id:references:communications
mix phx.gen.html IndividualCommunicationContext IndividualCommunication individuals_communications individual_id:references:individuals communication_id:references:communications

mix phx.gen.html TravelPreferenceContext TravelPreference travelpreferences has_wheelchair:boolean homeairport_location:string labelname:string mealtype_code:string preferred_aircraft_seat_type_code:string individual_id:references:individuals smoker:boolean

mix phx.gen.html TravelPreferenceContext FrequentFlyerCard frequentflyercards airline_name:string airline_iata_code:string frequent_flyer_number:string travelpreference_id:references:travelpreferences
mix phx.gen.html TravelPreferenceContext TravelCard travelcards travelcardtype:references:travelcardtypes travelcardnumber:string expiration:datetime travelpreference_id:references:travelpreferences

mix phx.gen.html IndividualIdentificationContext Identifications identification country_of_issue_id:references:countries dateofissue:datetime document_country_code_id:references:countries document_number:string expirationdate:datetime identificationtypecode:string is_main_passport:boolean issuing_authority:string place_of_issue:string individual_id:references:individuals

mix phx.gen.html RoleContext Role roles individual_id:references:individuals organisation_id:references:organisations begindate:datetime enddate:datetime roletypecode_id:references:roletypes

<!-- mix phx.gen.html BankAccountContext BankAccount bankaccounts bankname:string accountnr:string clearingnr:string iban:string swift:string bic:string vat_nr:string -->