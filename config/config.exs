# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_and_elm, ecto_repos: [PhoenixAndElm.Repo]

# Configures the endpoint
config :phoenix_and_elm, PhoenixAndElm.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "baoYW6OO9jbiR6e2tXURKD5ZqGyFiDThb03xFgbzyOrcp4s9ZDjkeSkb9pNJQhzq",
  render_errors: [view: PhoenixAndElm.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixAndElm.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arthur, :push, [
  {:post,
   [
     "#{Path.expand("node_modules/.bin/elm-format", System.cwd!())} web/elm/src --yes"
   ]}
]

config :arthur, :ci, [
  {:post,
   [
     "mix run priv/repo/seeds.exs > /dev/null",
     "#{Path.expand("node_modules/.bin/elm-format", System.cwd!())} --validate web/elm/src"
   ]}
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
