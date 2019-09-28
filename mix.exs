defmodule Blitzy.MixProject do
  use Mix.Project

  def project do
    [
      app: :blitzy,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Blitzy.CLI],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [ mode: { Blitzy, [] },
      extra_applications: [:logger, :httpoison, :timex]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:httpoison, "~> 1.5.0"},
     {:timex, "~> 3.6"},
     {:tzdata, "~> 0.1.8", override: true}
    ]
  end
end
