defmodule CostOfLivingApi.CityCostOfLiving do
  import Ecto.Query, warn: false
  alias Ecto.Repo
  alias CostOfLivingApi.Repo

  alias CostOfLivingApi.COLs.COL

  # Returns all data for selected city.
  def get_city(city, country) do
    Repo.get_by!(COL, city: city, country: country)
  end

  # Returns specified field.
  def get_city_data(city, country, field) do
    query =
      from c in COL,
        where: c.city == ^city and c.country == ^country,
        select: ^[field]

    Repo.one(query)
  end
end
