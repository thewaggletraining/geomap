# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :geomap,
  ecto_repos: [Geomap.Repo]

# Configures the endpoint
config :geomap, GeomapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FO3qNL0a4fcpkX21vZIkNh8ZvNYXRgrugBjxbCR6qFzyGiQJTMqes0OilXa00Np/",
  render_errors: [view: GeomapWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Geomap.PubSub,
  live_view: [signing_salt: "rL7lEsep"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
