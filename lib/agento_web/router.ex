defmodule AgentoWeb.Router do
  use AgentoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AgentoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AgentoWeb do
    pipe_through :browser

    live "/", PageLive, :index

    resources "/basedata/countries", CountryController
    resources "/basedata/currencies", CurrencyController
    resources "/basedata/airports", AirportController
    resources "/basedata/languages", LanguageController
    resources "/basedata/communication_type_codes", CommunicationTypeCodeController
    resources "/basedata/airlines", AirlineController
    resources "/basedata/travelcardtypes", TravelCardTypeController
    resources "/basedata/identificationtypecodes", IdentificationTypeCodeController
    resources "/basedata/addresstypes", AddressTypeController
    resources "/addresses", AddressController
    resources "/organisations", OrganisationController
    resources "/organisation_name_trans", OrganisationNameTransController
    resources "/organisations_addresses", OrganisationAddressController
    resources "/individuals", IndividualController
    resources "/individuals_addresses", IndividualAddressController
    resources "/communications", CommunicationController
    resources "/organisations_communications", OrganisationCommunicationsController
    resources "/individuals_communications", IndividualCommunicationController
    resources "/travelpreferences", TravelPreferenceController
    resources "/frequentflyercards", FrequentFlyerCardController
    resources "/travelcards", TravelCardController
    resources "/identification", IdentificationsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AgentoWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AgentoWeb.Telemetry
    end
  end
end
