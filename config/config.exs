# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :metaform,
  ecto_repos: [Metaform.Repo]

# Configures the endpoint
config :metaform, Metaform.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JE+kxh27Dn7oK4JzpABKJP2yW88SQ630bfjXBgdDy8Bt97Wb4OxUTprBfk8CYckY",
  render_errors: [view: Metaform.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Metaform.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
