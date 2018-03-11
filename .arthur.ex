defmodule Arthur do
  defp config do
    %{
      ci: %{
        post: [
          "mix run priv/repo/seeds.exs > /dev/null",
          "./node_modules/.bin/elm-format --validate web/elm/src"
        ]
      }
    }
  end
end
