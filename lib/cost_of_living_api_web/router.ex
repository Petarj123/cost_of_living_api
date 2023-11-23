defmodule CostOfLivingApiWeb.Router do
  use CostOfLivingApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CostOfLivingApiWeb.Controllers do
    pipe_through :api

    # City
    get "/city/all", CityCostOfLivingController, :get_all
    get "/city/inexpensive-meal-cost", CityCostOfLivingController, :get_inexpensive_meal_cost
    get "/city/mid-restaurant-meal-cost", CityCostOfLivingController, :get_mid_restaurant_meal_cost
    get "/city/mcmeal-cost", CityCostOfLivingController, :get_mcmeal_cost
    get "/city/domestic-beer-price", CityCostOfLivingController, :get_domestic_beer_price
    get "/city/imported-beer-price", CityCostOfLivingController, :get_imported_beer_price
    get "/city/cappuccino-price", CityCostOfLivingController, :get_cappuccino_price
    get "/city/coke-price", CityCostOfLivingController, :get_coke_price
    get "/city/water-price", CityCostOfLivingController, :get_water_price
    get "/city/milk-price", CityCostOfLivingController, :get_milk_price
    get "/city/bread-price", CityCostOfLivingController, :get_bread_price
    get "/city/rice-price", CityCostOfLivingController, :get_rice_price
    get "/city/eggs-price", CityCostOfLivingController, :get_eggs_price
    get "/city/local-cheese-price", CityCostOfLivingController, :get_local_cheese_price
    get "/city/chicken-fillets-price", CityCostOfLivingController, :get_chicken_fillets_price
    get "/city/beef-round-price", CityCostOfLivingController, :get_beef_round_price
    get "/city/apples-price", CityCostOfLivingController, :get_apples_price
    get "/city/banana-price", CityCostOfLivingController, :get_banana_price
    get "/city/oranges-price", CityCostOfLivingController, :get_oranges_price
    get "/city/tomato-price", CityCostOfLivingController, :get_tomato_price
    get "/city/potato-price", CityCostOfLivingController, :get_potato_price
    get "/city/onion-price", CityCostOfLivingController, :get_onion_price
    get "/city/lettuce-price", CityCostOfLivingController, :get_lettuce_price
    get "/city/water-bottle-price", CityCostOfLivingController, :get_water_bottle_price
    get "/city/wine-price", CityCostOfLivingController, :get_wine_price
    get "/city/domestic-beer-market-price", CityCostOfLivingController, :get_domestic_beer_market_price
    get "/city/imported-beer-market-price", CityCostOfLivingController, :get_imported_beer_market_price
    get "/city/cigarettes-price", CityCostOfLivingController, :get_cigarettes_price
    get "/city/one-way-ticket-price", CityCostOfLivingController, :get_one_way_ticket_price
    get "/city/monthly-pass-price", CityCostOfLivingController, :get_monthly_pass_price
    get "/city/taxi-start-price", CityCostOfLivingController, :get_taxi_start_price
    get "/city/taxi-1km-price", CityCostOfLivingController, :get_taxi_1km_price
    get "/city/taxi-1hour-waiting-price", CityCostOfLivingController, :get_taxi_1hour_waiting_price
    get "/city/gasoline-price", CityCostOfLivingController, :get_gasoline_price
    get "/city/volkswagen-golf-price", CityCostOfLivingController, :get_volkswagen_golf_price
    get "/city/toyota-corolla-price", CityCostOfLivingController, :get_toyota_corolla_price
    get "/city/utilities-cost", CityCostOfLivingController, :get_utilities_cost
    get "/city/mobile-tariff-price", CityCostOfLivingController, :get_mobile_tariff_price
    get "/city/internet-price", CityCostOfLivingController, :get_internet_price
    get "/city/fitness-club-membership-price", CityCostOfLivingController, :get_fitness_club_membership_price
    get "/city/tennis-court-rent-price", CityCostOfLivingController, :get_tennis_court_rent_price
    get "/city/cinema-ticket-price", CityCostOfLivingController, :get_cinema_ticket_price
    get "/city/preschool-price", CityCostOfLivingController, :get_preschool_price
    get "/city/international-primary-school-price", CityCostOfLivingController, :get_international_primary_school_price
    get "/city/jeans-price", CityCostOfLivingController, :get_jeans_price
    get "/city/summer-dress-price", CityCostOfLivingController, :get_summer_dress_price
    get "/city/nike-shoes-price", CityCostOfLivingController, :get_nike_shoes_price
    get "/city/leather-business-shoes-price", CityCostOfLivingController, :get_leather_business_shoes_price
    get "/city/apartment-in-city-centre-price", CityCostOfLivingController, :get_apartment_in_city_centre_price
    get "/city/apartment-outside-centre-price", CityCostOfLivingController, :get_apartment_outside_center_price
    get "/city/3bedroom-apartment-in-city-centre-price", CityCostOfLivingController, :get_3bedroom_apartment_in_city_centre_price
    get "/city/3bedroom-apartment-outside-centre-price", CityCostOfLivingController, :get_3bedroom_apartment_outside_centre_price
    get "/city/price-per-sqm-in-city-centre", CityCostOfLivingController, :get_price_per_sqm_in_city_centre
    get "/city/price-per-sqm-outside-centre", CityCostOfLivingController, :get_price_per_sqm_outside_centre
    get "/city/average-monthly-net-salary", CityCostOfLivingController, :get_average_monthly_net_salary
    get "/city/mortgage-interest-rate", CityCostOfLivingController, :get_mortgage_interest_rate

    # Country
    get "/country", CountryCostOfLivingController, :get_country
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:cost_of_living_api, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
