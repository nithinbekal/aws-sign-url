defmodule AwsSignUrl.Mixfile do
  use Mix.Project

  def project do
    [app: :aws_sign_url,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: [],
     description: "Provides a function to sign Amazon REST API request URLs",
     package: package,
    ]
  end

  def application do
    [applications: [:logger]]
  end

  def package do
    [ name: :aws_sign_url,
      files: ["lib", "mix.exs"],
      maintainers: ["Nithin Bekal"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/nithinbekal/aws-sign-url"},
    ]
  end
end
