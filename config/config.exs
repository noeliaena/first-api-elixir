# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# General application configuration
config :musicapp, ecto_repos: [Musicapp.Repo]

# Database configuration
config :musicapp, Musicapp.Repo,
  database: "musicdb",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :musicapp, port: 4000

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
