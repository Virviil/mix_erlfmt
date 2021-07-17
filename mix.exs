defmodule MixErlfmt.MixProject do
  use Mix.Project

  def project do
    [
      app: :mix_erlfmt,
      version: "0.1.1",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "erlfmt formatter for Mix projects",
      package: package(),
    ]
  end

  defp deps do
    [
      {:erlfmt, "~> 0.12.0"},
      {:getopt, "~> 1.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/virviil/mix_erlfmt"}
    ]
  end
end
