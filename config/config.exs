# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ranking_app,
  ecto_repos: [RankingApp.Repo]

# Configures the endpoint
config :ranking_app, RankingAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0Aet9o5g1DFKs9bBu2pkKjxtYxNuVJnTNmISk7cOTLBeOV5YH4GoyrFENxuIf75D",
  render_errors: [view: RankingAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RankingApp.PubSub,
  live_view: [signing_salt: "IE0C2F9/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :cors_plug,
  origin: ["*"],
  methods: ["GET"]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
