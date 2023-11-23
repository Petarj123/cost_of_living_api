defmodule CostOfLivingApiWeb.Controllers.CityCostOfLivingController do
  use CostOfLivingApiWeb, :controller
  alias CostOfLivingApiWeb.Service.CityService

  @fields_and_functions [
    {:x1, :get_inexpensive_meal_cost},
    {:x2, :get_mid_restaurant_meal_cost},
    {:x3, :get_mcmeal_cost},
    {:x4, :get_domestic_beer_price},
    {:x5, :get_imported_beer_price},
    {:x6, :get_cappuccino_price},
    {:x7, :get_coke_price},
    {:x8, :get_water_price},
    {:x9, :get_milk_price},
    {:x10, :get_bread_price},
    {:x11, :get_rice_price},
    {:x12, :get_eggs_price},
    {:x13, :get_local_cheese_price},
    {:x14, :get_chicken_fillets_price},
    {:x15, :get_beef_round_price},
    {:x16, :get_apples_price},
    {:x17, :get_banana_price},
    {:x18, :get_oranges_price},
    {:x19, :get_tomato_price},
    {:x20, :get_potato_price},
    {:x21, :get_onion_price},
    {:x22, :get_lettuce_price},
    {:x23, :get_water_bottle_price},
    {:x24, :get_wine_price},
    {:x25, :get_domestic_beer_market_price},
    {:x26, :get_imported_beer_market_price},
    {:x27, :get_cigarettes_price},
    {:x28, :get_one_way_ticket_price},
    {:x29, :get_monthly_pass_price},
    {:x30, :get_taxi_start_price},
    {:x31, :get_taxi_1km_price},
    {:x32, :get_taxi_1hour_waiting_price},
    {:x33, :get_gasoline_price},
    {:x34, :get_volkswagen_golf_price},
    {:x35, :get_toyota_corolla_price},
    {:x36, :get_utilities_cost},
    {:x37, :get_mobile_tariff_price},
    {:x38, :get_internet_price},
    {:x39, :get_fitness_club_membership_price},
    {:x40, :get_tennis_court_rent_price},
    {:x41, :get_cinema_ticket_price},
    {:x42, :get_preschool_price},
    {:x43, :get_international_primary_school_price},
    {:x44, :get_jeans_price},
    {:x45, :get_summer_dress_price},
    {:x46, :get_nike_shoes_price},
    {:x47, :get_leather_business_shoes_price},
    {:x48, :get_apartment_in_city_centre_price},
    {:x49, :get_apartment_outside_center_price},
    {:x50, :get_3bedroom_apartment_in_city_centre_price},
    {:x51, :get_3bedroom_apartment_outside_centre_price},
    {:x52, :get_price_per_sqm_in_city_centre},
    {:x53, :get_price_per_sqm_outside_centre},
    {:x54, :get_average_monthly_net_salary},
    {:x55, :get_mortgage_interest_rate}
  ]

  def get_all(conn, %{"city" => city, "country" => country}) do
    case CityService.get_all(city, country) do
      %{error: "Data not found."} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Data not found."})

      city_data ->
        conn
        |> put_status(:ok)
        |> json(city_data)
    end
  end


  Enum.each(@fields_and_functions, fn {_, function} ->
    def unquote(function)(conn, %{"city" => city, "country" => country}) do
      case CityService.unquote(function)(city, country) do
        %{cost: cost} ->
          conn
          |> put_status(:ok)
          |> json(%{city: city, price: "#{cost}$"})
        _ ->
          conn
          |> put_status(:not_found)
          |> json(%{error: "Data not found."})
      end
    end
  end)

end
