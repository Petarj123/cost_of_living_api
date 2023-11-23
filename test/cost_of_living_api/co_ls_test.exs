defmodule CostOfLivingApi.COLsTest do
  use CostOfLivingApi.DataCase

  alias CostOfLivingApi.COLs

  describe "cost_of_living" do
    alias CostOfLivingApi.COLs.COL

    import CostOfLivingApi.COLsFixtures

    @invalid_attrs %{}

    test "list_cost_of_living/0 returns all cost_of_living" do
      col = col_fixture()
      assert COLs.list_cost_of_living() == [col]
    end

    test "get_col!/1 returns the col with given id" do
      col = col_fixture()
      assert COLs.get_col!(col.id) == col
    end

    test "create_col/1 with valid data creates a col" do
      valid_attrs = %{}

      assert {:ok, %COL{} = col} = COLs.create_col(valid_attrs)
    end

    test "create_col/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = COLs.create_col(@invalid_attrs)
    end

    test "update_col/2 with valid data updates the col" do
      col = col_fixture()
      update_attrs = %{}

      assert {:ok, %COL{} = col} = COLs.update_col(col, update_attrs)
    end

    test "update_col/2 with invalid data returns error changeset" do
      col = col_fixture()
      assert {:error, %Ecto.Changeset{}} = COLs.update_col(col, @invalid_attrs)
      assert col == COLs.get_col!(col.id)
    end

    test "delete_col/1 deletes the col" do
      col = col_fixture()
      assert {:ok, %COL{}} = COLs.delete_col(col)
      assert_raise Ecto.NoResultsError, fn -> COLs.get_col!(col.id) end
    end

    test "change_col/1 returns a col changeset" do
      col = col_fixture()
      assert %Ecto.Changeset{} = COLs.change_col(col)
    end
  end
end
