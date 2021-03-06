defmodule Logrex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      supervisor(Logrex.Repo, []),
      supervisor(Phoenix.PubSub.PG2, [Logrex.PubSub, []]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Logrex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
