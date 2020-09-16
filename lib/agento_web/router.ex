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

    resources "/countries", CountryController
    resources "/currencies", CurrencyController
    resources "/airports", AirportController
    resources "/languages", LanguageController
    resources "/communication_type_codes", CommunicationTypeCodeController
    resources "/airlines", AirlineController
    resources "/travelcardtypes", TravelCardTypeController
    resources "/identificationtypecodes", IdentificationTypeCodeController
    resources "/addresstypes", AddressTypeController
    resources "/roletypes", RoleTypeController
    resources "/organisations", OrganisationController
    resources "/organisation_name_trans", OrganisationNameTransController
    resources "/individuals", IndividualController
    resources "/addresses", AddressController
    resources "/communications", CommunicationController
    resources "/travelpreferences", TravelPreferenceController
    resources "/frequentflyercards", FrequentFlyerCardController
    resources "/travelcards", TravelCardController
    resources "/identification", IdentificationsController
    resources "/roles", RoleController
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
