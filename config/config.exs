# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :logrex, Logrex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "logrex_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"


config :logrex,
  ecto_repos: [Logrex.Repo]

import_config "#{Mix.env}.exs"
