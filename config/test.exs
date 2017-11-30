use Mix.Config

config :logrex, Logrex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "logrex_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn
