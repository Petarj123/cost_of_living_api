defmodule CostOfLivingApiWeb.Service.CountryService do
  alias CostOfLivingApi.COLs.ColAvg
  alias CostOfLivingApi.CountryCostOfLiving

  def get_country(country) do
    case CountryCostOfLiving.get_country(country) do
      nil -> %{error: "Data not found"}
      %ColAvg{} = col ->
        transform_data(col)
    end
  end

  defp transform_data(col) do
    %{
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

end
