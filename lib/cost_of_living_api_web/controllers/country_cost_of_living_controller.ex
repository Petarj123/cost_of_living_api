defmodule CostOfLivingApiWeb.Controllers.CountryCostOfLivingController do
  use CostOfLivingApiWeb, :controller
  alias CostOfLivingApiWeb.Service.CountryService

  def get_country(conn, %{"country" => country}) do
    case CountryService.get_country(country) do
      %{error: _error_message} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "#{country} not found."})

      country_data ->
        conn
        |> put_status(:ok)
        |> json(country_data)
    end
  end
end
