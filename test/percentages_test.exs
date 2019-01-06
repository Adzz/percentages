defmodule PercentagesTest do
  use ExUnit.Case
  doctest Percentages, import: true

  describe "two digit numbers and less integer" do
    test "Returns all of the percentages that produce a whole number for 10" do
      expected = [100.0, 90.0, 80.0, 70.0, 60.0, 50.0, 40.0, 30.0, 20.0, 10.0, 0.0]
      assert Percentages.that_produce_whole_numbers_for(10) == expected
    end

    test "Returns all of the percentages that produce a whole number for 7" do
      expected = [
        100.0,
        85.71428571428571,
        71.42857142857143,
        57.142857142857146,
        42.857142857142854,
        28.571428571428573,
        14.285714285714286,
        0.0
      ]

      assert Percentages.that_produce_whole_numbers_for(7) == expected
    end
  end

  describe "two digit numbers and less decimal" do
    test "Returns all of the percentages that produce a whole number for 10" do
      expected = [
        Decimal.new("100"),
        Decimal.new("90"),
        Decimal.new("80"),
        Decimal.new("70"),
        Decimal.new("60"),
        Decimal.new("50"),
        Decimal.new("40"),
        Decimal.new("30"),
        Decimal.new("20"),
        Decimal.new("10"),
        Decimal.new("0")
      ]

      assert Percentages.that_produce_whole_numbers_for(Decimal.new(10)) == expected
    end

    test "Returns all of the percentages that produce a whole number for 7" do
      expected = [
        Decimal.new("100"),
        Decimal.new("85.71428571428571428571428571"),
        Decimal.new("71.42857142857142857142857143"),
        Decimal.new("57.14285714285714285714285714"),
        Decimal.new("42.85714285714285714285714286"),
        Decimal.new("28.57142857142857142857142857"),
        Decimal.new("14.28571428571428571428571429"),
        Decimal.new("0")
      ]

      assert Percentages.that_produce_whole_numbers_for(Decimal.new(7)) == expected
    end
  end
end
