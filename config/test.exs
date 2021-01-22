use Mix.Config

config :ex_mon, ExMon.Repo,
  username: "postgres",
  password: "postgres",
  database: "ex_mon_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :ex_mon, ExMonWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
