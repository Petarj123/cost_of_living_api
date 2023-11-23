defmodule CostOfLivingApi.COLs.ColAvg do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "cost_of_living_averages" do
    field :country, :string
    field :x1, :decimal
    field :x2, :decimal
    field :x3, :decimal
    field :x4, :decimal
    field :x5, :decimal
    field :x6, :decimal
    field :x7, :decimal
    field :x8, :decimal
    field :x9, :decimal
    field :x10, :decimal
    field :x11, :decimal
    field :x12, :decimal
    field :x13, :decimal
    field :x14, :decimal
    field :x15, :decimal
    field :x16, :decimal
    field :x17, :decimal
    field :x18, :decimal
    field :x19, :decimal
    field :x20, :decimal
    field :x21, :decimal
    field :x22, :decimal
    field :x23, :decimal
    field :x24, :decimal
    field :x25, :decimal
    field :x26, :decimal
    field :x27, :decimal
    field :x28, :decimal
    field :x29, :decimal
    field :x30, :decimal
    field :x31, :decimal
    field :x32, :decimal
    field :x33, :decimal
    field :x34, :decimal
    field :x35, :decimal
    field :x36, :decimal
    field :x37, :decimal
    field :x38, :decimal
    field :x39, :decimal
    field :x40, :decimal
    field :x41, :decimal
    field :x42, :decimal
    field :x43, :decimal
    field :x44, :decimal
    field :x45, :decimal
    field :x46, :decimal
    field :x47, :decimal
    field :x48, :decimal
    field :x49, :decimal
    field :x50, :decimal
    field :x51, :decimal
    field :x52, :decimal
    field :x53, :decimal
    field :x54, :decimal
    field :x55, :decimal
    field :data_quality, :integer

  end

  def changeset(col, attrs) do
    col
    |> cast(attrs, [
      :country,
      :x1,
      :x2,
      :x3,
      :x4,
      :x5,
      :x6,
      :x7,
      :x8,
      :x9,
      :x10,
      :x11,
      :x12,
      :x13,
      :x14,
      :x15,
      :x16,
      :x17,
      :x18,
      :x19,
      :x20,
      :x21,
      :x22,
      :x23,
      :x24,
      :x25,
      :x26,
      :x27,
      :x28,
      :x29,
      :x30,
      :x31,
      :x32,
      :x33,
      :x34,
      :x35,
      :x36,
      :x37,
      :x38,
      :x39,
      :x40,
      :x41,
      :x42,
      :x43,
      :x44,
      :x45,
      :x46,
      :x47,
      :x48,
      :x49,
      :x50,
      :x51,
      :x52,
      :x53,
      :x54,
      :x55,
      :data_quality
    ])
    |> validate_required([:country])
  end
end
