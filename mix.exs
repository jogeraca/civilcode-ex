defmodule CivilCode.MixProject do
  use Mix.Project

  def project do
    [
      app: :civilcode,
      version: "0.0.0",
      build_path: "_build",
      config_path: "config/config.exs",
      deps_path: "deps",
      elixirc_paths: elixirc_paths(Mix.env()),
      lockfile: "mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        extras: ["README.md"],
        groups_for_modules: [
          "Adapters for Ports": [
            CivilCode.Repository,
            CivilCode.Repository.Behaviour,
            CivilCode.RepositoryError
          ],
          Application: [
            CivilCode.ApplicationService,
            CivilCode.Command,
            CivilCode.Params,
            CivilCode.ProcessManager,
            CivilCode.QueryResult,
            CivilCode.QueryService
          ],
          Data: [
            CivilCode.Record
          ],
          "Domain Model": [
            CivilCode.AggregateRoot,
            CivilCode.BusinessRuleViolation,
            CivilCode.Entity,
            CivilCode.EntityId,
            CivilCode.DomainEvent,
            CivilCode.DomainService,
            CivilCode.ValueObject
          ],
          Types: [
            CivilCode.Maybe,
            CivilCode.Result,
            CivilCode.ResultList
          ]
        ]
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Development
      {:dialyxir, "~> 1.1", only: :dev, runtime: false},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false},

      # Runtime
      {:currying, "~> 1.0.3"},
      {:ecto, ">= 3.0.0"},
      {:jason, "~> 1.3"},
      {:typed_struct, "~> 0.3", runtime: false},
      {:elixir_uuid, "~> 1.2"}
    ]
  end
end
