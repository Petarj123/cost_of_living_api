defmodule CostOfLivingApi.COLsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CostOfLivingApi.COLs` context.
  """

  @doc """
  Generate a col.
  """
  def col_fixture(attrs \\ %{}) do
    {:ok, col} =
      attrs
      |> Enum.into(%{

      })
      |> CostOfLivingApi.COLs.create_col()

    col
  end
end
