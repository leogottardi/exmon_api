use Mix.Config

config :ex_mon,
  ecto_repos: [ExMon.Repo]

config :ex_mon, ExMonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eeOJHs63UFfDzDC5FbXIDViwkzttoicc9kxFZW0kGC087eapD8BS8UqA1uJTKg1f",
  render_errors: [view: ExMonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMon.PubSub,
  live_view: [signing_salt: "ONh6wggf"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
