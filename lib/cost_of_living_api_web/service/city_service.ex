defmodule CostOfLivingApiWeb.Service.CityService do
  alias CostOfLivingApi.CityCostOfLiving
  alias CostOfLivingApi.COLs.COL

  # Returns all relevant data for that city
  def get_all(city, country) do
    case CityCostOfLiving.get_city(city, country) do
      nil -> %{error: "Data not found."}
      %COL{} = col ->
        transform_data(col)
    end
  end

  def transform_data(col) do
    %{
      city: col.city,
      country: col.country,
      inexpensive_meal_cost: round_decimal(col.x1),
      mid_restaurant_meal_cost: round_decimal(col.x2),
      mc_meal_cost: round_decimal(col.x3),
      domestic_beer_price: round_decimal(col.x4),
      imported_beer_price: round_decimal(col.x5),
      cappuccino_price: round_decimal(col.x6),
      coke_price: round_decimal(col.x7),
      water_price: round_decimal(col.x8),
      milk_price: round_decimal(col.x9),
      bread_price: round_decimal(col.x10),
      rice_price: round_decimal(col.x11),
      eggs_price: round_decimal(col.x12),
      local_cheese_price: round_decimal(col.x13),
      chicken_fillets_price: round_decimal(col.x14),
      beef_round_price: round_decimal(col.x15),
      apples_price: round_decimal(col.x16),
      banana_price: round_decimal(col.x17),
      oranges_price: round_decimal(col.x18),
      tomato_price: round_decimal(col.x19),
      potato_price: round_decimal(col.x20),
      onion_price: round_decimal(col.x21),
      lettuce_price: round_decimal(col.x22),
      water_bottle_price: round_decimal(col.x23),
      wine_price: round_decimal(col.x24),
      domestic_beer_market_price: round_decimal(col.x25),
      imported_beer_market_price: round_decimal(col.x26),
      cigarettes_price: round_decimal(col.x27),
      one_way_ticket_price: round_decimal(col.x28),
      monthly_pass_price: round_decimal(col.x29),
      taxi_start_price: round_decimal(col.x30),
      taxi_1km_price: round_decimal(col.x31),
      taxi_1hour_waiting_price: round_decimal(col.x32),
      gasoline_price: round_decimal(col.x33),
      volkswagen_golf_price: round_decimal(col.x34),
      toyota_corolla_price: round_decimal(col.x35),
      utilities_cost: round_decimal(col.x36),
      mobile_tariff_price: round_decimal(col.x37),
      internet_price: round_decimal(col.x38),
      fitness_club_membership_price: round_decimal(col.x39),
      tennis_court_rent_price: round_decimal(col.x40),
      cinema_ticket_price: round_decimal(col.x41),
      preschool_price: round_decimal(col.x42),
      international_primary_school_price: round_decimal(col.x43),
      jeans_price: round_decimal(col.x44),
      summer_dress_price: round_decimal(col.x45),
      nike_shoes_price: round_decimal(col.x46),
      leather_business_shoes_price: round_decimal(col.x47),
      one_bedroom_apartment_rent_in_city_centre_price: round_decimal(col.x48),
      one_bedroom_apartment_rent_outside_centre_price: round_decimal(col.x49),
      three_bedroom_apartment_rent_in_city_centre_price: round_decimal(col.x50),
      three_bedroom_apartment_rent_outside_centre_price: round_decimal(col.x51),
      price_per_sqm_in_city_centre: round_decimal(col.x52),
      price_per_sqm_outside_centre: round_decimal(col.x53),
      average_monthly_net_salary: round_decimal(col.x54),
      mortgage_interest_rate: round_decimal_pct(col.x55)
    }
  end


  defp round_decimal(binary_decimal) do
    case binary_decimal do
      nil -> "N/A"
      _ ->
        formatted_value = binary_decimal
        |> Decimal.new()
        |> Decimal.to_float()
        |> Float.round(2)
        |> to_string()

        formatted_value <> "$"
    end
  end

  defp round_decimal_pct(binary_decimal) do
    case binary_decimal do
      nil -> "N/A"
      _ ->
        formatted_value = binary_decimal
        |> Decimal.new()
        |> Decimal.to_float()
        |> Float.round(2)
        |> to_string()

        formatted_value <> "%"
    end
  end

  # Returns cost of meal in inexpensive restaurant (USD)
  def get_inexpensive_meal_cost(city, country) do
    field = :x1
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of meal for 2 people in mid-range restaurant, three-course (USD)
  def get_mid_restaurant_meal_cost(city, country) do
    field = :x2
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of McMeal at McDonalds (USD)
  def get_mcmeal_cost(city, country) do
    field = :x3
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of domestic beer (0.5, in restaurants) (USD)
  def get_domestic_beer_price(city, country) do
    field = :x4
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of imported beer (0.33, in restaurants) (USD)
  def get_imported_beer_price(city, country) do
    field = :x5
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of cappuccino (regular, in restaurants) (USD)
  def get_cappuccino_price(city, country) do
    field = :x6
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of coke/pepsi  (0.33, in restaurants (USD)
  def get_coke_price(city, country) do
    field = :x7
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of water (0.33, in restaurants) (USD)
  def get_water_price(city, country) do
    field = :x8
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of milk (1L) (USD)
  def get_milk_price(city, country) do
    field = :x9
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of fresh loaf of white bread (500g) (USD)
  def get_bread_price(city, country) do
    field = :x10
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of white rice (1kg) (USD)
  def get_rice_price(city, country) do
    field = :x11
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of eggs (regular) (12) (USD)
  def get_eggs_price(city, country) do
    field = :x12
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of local cheese (1kg) (USD)
  def get_local_cheese_price(city, country) do
    field = :x13
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of chicken fillets (1kg) (USD)
  def get_chicken_fillets_price(city, country) do
    field = :x14
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of beef round (1kg) (or Equivalent Back Leg Red Meat) (USD)
  def get_beef_round_price(city, country) do
    field = :x15
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of apples (1kg) (USD)
  def get_apples_price(city, country) do
    field = :x16
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of banana (1kg) (USD)
  def get_banana_price(city, country) do
    field = :x17
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of oranges (1kg) (USD)
  def get_oranges_price(city, country) do
    field = :x18
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of tomato (1kg) (USD)
  def get_tomato_price(city, country) do
    field = :x19
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of potato (1kg) (USD)
  def get_potato_price(city, country) do
    field = :x20
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of onion (1kg) (USD)
  def get_onion_price(city, country) do
    field = :x21
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of lettuce (1 head) (USD)
  def get_lettuce_price(city, country) do
    field = :x22
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of water (1.5 liter bottle, at the market) (USD)
  def get_water_bottle_price(city, country) do
    field = :x23
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of a bottle of wine (Mid-Range, at the market) (USD)
  def get_wine_price(city, country) do
    field = :x24
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of domestic beer (0.5 liter bottle, at the market) (USD)
  def get_domestic_beer_market_price(city, country) do
    field = :x25
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of imported beer (0.33 liter bottle, at the market) (USD)
  def get_imported_beer_market_price(city, country) do
    field = :x26
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of a pack of cigarettes (Marlboro) (USD)
  def get_cigarettes_price(city, country) do
    field = :x27
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of a one-way ticket (Local Transport) (USD)
  def get_one_way_ticket_price(city, country) do
    field = :x28
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of a monthly pass (Regular Price) (USD)
  def get_monthly_pass_price(city, country) do
    field = :x29
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of taxi start (Normal Tariff) (USD)
  def get_taxi_start_price(city, country) do
    field = :x30
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of taxi 1km (Normal Tariff) (USD)
  def get_taxi_1km_price(city, country) do
    field = :x31
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of taxi 1-hour waiting (Normal Tariff) (USD)
  def get_taxi_1hour_waiting_price(city, country) do
    field = :x32
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of gasoline (1 liter) (USD)
  def get_gasoline_price(city, country) do
    field = :x33
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car) (USD)
  def get_volkswagen_golf_price(city, country) do
    field = :x34
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car) (USD)
  def get_toyota_corolla_price(city, country) do
    field = :x35
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of basic utilities (Electricity, Heating, Cooling, Water, Garbage) for an 85m2 apartment (USD)
  def get_utilities_cost(city, country) do
    field = :x36
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of 1 min. of prepaid mobile tariff (Local) (USD)
  def get_mobile_tariff_price(city, country) do
    field = :x37
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of internet (60 Mbps or more, unlimited data, Cable/ADSL) (USD)
  def get_internet_price(city, country) do
    field = :x38
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of fitness club membership (Monthly fee for 1 Adult) (USD)
  def get_fitness_club_membership_price(city, country) do
    field = :x39
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of tennis court rent (1 Hour on Weekend) (USD)
  def get_tennis_court_rent_price(city, country) do
    field = :x40
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of cinema ticket (International Release, 1 Seat) (USD)
  def get_cinema_ticket_price(city, country) do
    field = :x41
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of preschool or kindergarten (Full Day, Private, Monthly for 1 Child) (USD)
  def get_preschool_price(city, country) do
    field = :x42
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of international primary school (Yearly for 1 Child) (USD)
  def get_international_primary_school_price(city, country) do
    field = :x43
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of 1 Pair of Jeans (Levis 501 Or Similar) (USD)
  def get_jeans_price(city, country) do
    field = :x44
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of 1 Summer Dress in a Chain Store (Zara, H&M, etc.) (USD)
  def get_summer_dress_price(city, country) do
    field = :x45
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of 1 Pair of Nike Running Shoes (Mid-Range) (USD)
  def get_nike_shoes_price(city, country) do
    field = :x46
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of 1 Pair of Men Leather Business Shoes (USD)
  def get_leather_business_shoes_price(city, country) do
    field = :x47
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Apartment (1 bedroom) in City Centre (USD)
  def get_apartment_in_city_centre_price(city, country) do
    field = :x48
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Apartment (1 bedroom) Outside of Centre (USD)
  def get_apartment_outside_center_price(city, country) do
    field = :x49
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Apartment (3 bedrooms) in City Centre (USD)
  def get_3bedroom_apartment_in_city_centre_price(city, country) do
    field = :x50
    get_cost_data_by_field(city, country, field)
  end

  # Returns cost of Apartment (3 bedrooms) Outside of Centre (USD)
  def get_3bedroom_apartment_outside_centre_price(city, country) do
    field = :x51
    get_cost_data_by_field(city, country, field)
  end

  # Returns price per square meter to buy an apartment in City Centre (USD)
  def get_price_per_sqm_in_city_centre(city, country) do
    field = :x52
    get_cost_data_by_field(city, country, field)
  end

  # Returns price per square meter to buy an apartment outside of Centre (USD)
  def get_price_per_sqm_outside_centre(city, country) do
    field = :x53
    get_cost_data_by_field(city, country, field)
  end

  # Returns average monthly net salary (After Tax) (USD)
  def get_average_monthly_net_salary(city, country) do
    field = :x54
    get_cost_data_by_field(city, country, field)
  end

  # Returns mortgage interest rate in percentages (%) yearly for 20 years fixed-rate
  def get_mortgage_interest_rate(city, country) do
    field = :x55
    get_cost_data_by_field(city, country, field)
  end

  defp get_cost_data_by_field(city, country, field) do
    case CityCostOfLiving.get_city_data(city, country, field) do
      %{^field => cost} when not is_nil(cost) ->
        rounded_cost = Decimal.round(cost, 2)
        %{cost: Decimal.to_string(rounded_cost)}
      _ -> nil
    end
  end
end
