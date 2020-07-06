# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :agento,
  ecto_repos: [Agento.Repo]

# Configures the endpoint
config :agento, AgentoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JBEVmcT+E2U8hJdipQDHFrF0QLdR7Y5J41Cgu53sSjbKlPgIkhuunus4zSy6McHD",
  render_errors: [view: AgentoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Agento.PubSub,
  live_view: [signing_salt: "iXFs0hXJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
