# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pogogo,
  ecto_repos: [Pogogo.Repo]

# Configures the endpoint
config :pogogo, Pogogo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x+68Y+SlkoCLEY0Py7Ls62gLtPnYng1i9vMQmx4ltYHLRX6NtIrDRnMSQiuQsZm0",
  render_errors: [view: Pogogo.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pogogo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Make it use jsonapi
config :phoenix, :format_encoders,
"json-api": Poison

config :plug, :mimes, %{
"application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
