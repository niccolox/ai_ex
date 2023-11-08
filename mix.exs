defmodule Ai.MixProject do
  use Mix.Project

  def project do
    [
      app: :ai,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bumblebee, "~> 0.4.2"},
      {:exla, "~> 0.6.1"},
      {:explorer, "~> 0.7.1"},
      {:image, "~> 0.38.3"},
      {:openai, "~> 0.5.4"},
      {:scholar, "~> 0.2.1"},
#      {:scidata, "~> 0.1.11", override: true},
      {:tflite_elixir, "~> 0.3.4"},
      {:torchx, "~> 0.6.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}

    ]
  end
end
