defmodule AiEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ai_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  defp description() do
    "AI Elixir convenience package to install Bumblebee, Nx, Explorer, Scholar, Image, Torch, Tensorflow etc. Inspired by npm -i ai"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ai_ex",
      # These are the default files included in the package
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/niccolox/ai_ex"}
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
      {:ai, "~> 0.3.4"},
      {:anthropic, "~> 0.1.0"},
      {:bumblebee, "~> 0.4.2"},
      # https://docs.cohere.com/reference/about
      {:exla, "~> 0.6.1"},
      {:explorer, github: "niccolox/explorer"},
#     {:explorer, "~> 0.7.1"},
      {:ex_doc, ">= 0.0.0"},
      # https://app.fireworks.ai/
      {:image, "~> 0.38.3"},
#      {:langchain, "~> 0.1.2"},
      {:openai, "~> 0.5.4"},
      {:replicate, "~> 1.2"},
      {:scholar, "~> 0.2.1"},
#      {:scidata, "~> 0.1.11", override: true},
      {:tflite_elixir, "~> 0.3.4"},
      {:torchx, "~> 0.6.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}

    ]
  end
end
