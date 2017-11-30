use Mix.Config

config :logrex, Logrex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "logrex_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
