defmodule CostOfLivingApi.CountryCostOfLiving do
  import Ecto.Query, warn: false
  alias Ecto.Repo
  alias CostOfLivingApi.Repo

  alias CostOfLivingApi.COLs.ColAvg

  def get_country(country) do
    Repo.get_by!(ColAvg, country: country)
  end
end
