defmodule Musicapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :musicapp,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Musicapp.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:ecto_sql, "~> 3.0.4"},
      {:postgrex, "~> 0.14.1"},
      {:jason, "~> 1.1"},
    ]
  end
end
