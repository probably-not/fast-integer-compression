defmodule FastIntegerCompression.MixProject do
  use Mix.Project

  def project do
    [
      app: :fast_integer_compression,
      version: "0.0.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_path(Mix.env()),
      deps: deps(),
      name: "FastIntegerCompression",
      description: "A pure-Elixir port of FastIntegerCompression.js",
      source_url: "https://github.com/probably-not/fast-integer-compression",
      homepage_url: "https://github.com/probably-not/fast-integer-compression",
      package: [
        maintainers: ["Coby Benveniste"],
        licenses: ["Apache 2.0"],
        links: %{"GitHub" => "https://github.com/probably-not/fast-integer-compression"},
        files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"]
      ],
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        ci: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      docs: docs(),
      dialyzer: [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}, plt_add_deps: :app_tree]
    ]
  end

  defp elixirc_path(:test), do: ["lib/", "test/support"]
  defp elixirc_path(_), do: ["lib/"]

  def application do
    [
      extra_applications: applications(Mix.env())
    ]
  end

  defp applications(:dev), do: applications(:all) ++ [:remixed_remix, :runtime_tools]
  defp applications(_all), do: [:logger]

  defp deps do
    [
      ## Testing and Development Dependencies
      {:ex_doc, "~> 0.34.2", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:remixed_remix, "~> 2.0.2", only: :dev},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      quality: ["format", "credo --strict", "dialyzer"],
      ci: ["coveralls", "format --check-formatted", "credo --strict", "dialyzer"]
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "README.md": [title: "README"]
      ],
      groups_for_extras: [],
      skip_undefined_reference_warnings_on: Path.wildcard("**/*.md"),
      main: "FastIntegerCompression"
    ]
  end
end
