use Mix.Config

config :arthur, :push,
  post: [
    "#{Path.expand("node_modules/.bin/elm-format", System.cwd!())} web/elm/src --yes"
  ]

config :arthur, :ci,
  post: [
    "mix run priv/repo/seeds.exs > /dev/null",
    "#{Path.expand("node_modules/.bin/elm-format", System.cwd!())} --validate web/elm/src"
  ]
