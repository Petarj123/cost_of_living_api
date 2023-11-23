defmodule CostOfLivingApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CostOfLivingApiWeb.Telemetry,
      CostOfLivingApi.Repo,
      {DNSCluster, query: Application.get_env(:cost_of_living_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CostOfLivingApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CostOfLivingApi.Finch},
      # Start a worker by calling: CostOfLivingApi.Worker.start_link(arg)
      # {CostOfLivingApi.Worker, arg},
      # Start to serve requests, typically the last entry
      CostOfLivingApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CostOfLivingApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CostOfLivingApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
