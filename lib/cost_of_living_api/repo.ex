defmodule CostOfLivingApi.Repo do
  use Ecto.Repo,
    otp_app: :cost_of_living_api,
    adapter: Ecto.Adapters.Postgres
end
