# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :abel,
  ecto_repos: [Abel.Repo]

# Configures the endpoint
config :abel, AbelWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PT0XyxufvIjUkAttNmSAlxTVZguep3P+AgoxTgnnzYV3mQMUuovuSZobeyM0Q27c",
  render_errors: [view: AbelWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Abel.PubSub,
  live_view: [signing_salt: "Is8UGGjF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
