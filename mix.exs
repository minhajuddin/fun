defmodule Fun.Mixfile do
  use Mix.Project

  def project do
    [
      app: :fun,
      description: "A collection of functions to help write more functional code",
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
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
      {:ex_doc, "~> 0.16.0"}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/minhajuddin/funs"},
      maintainers: ["Khaja Minhajuddin"],
    ]
  end
end
