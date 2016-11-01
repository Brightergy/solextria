defmodule Solextria.Mixfile do
  use Mix.Project

  def project do
    [app: :solextria,
     version: "0.1.1",
     description: "Solectria DataLogger data fetcher and parser",
     source_url: "https://github.com/Brightergy/solextria",
     homepage_url: "https://github.com/Brightergy/solextria",
     package: package,
     elixir: "~> 1.2 or ~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test, "coveralls.semaphore": :test],
     docs: [logo: "logo/brighterlink_logo.png",
            extras: ["README.md"]],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :floki]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.8 or ~> 0.9.0"},
      {:floki, "~> 0.10.0"},
      {:http_digex, "~> 0.0.1"},
      {:ex_doc, "~> 0.12", only: :dev},
      {:excoveralls, "~> 0.5", only: :test},
    ]
  end

  defp package do
    [
      maintainers: [
        "Samar Acharya"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Brightergy/solextria"},
      files: ~w(config lib logo mix.exs README.md LICENSE)
    ]
  end
end
