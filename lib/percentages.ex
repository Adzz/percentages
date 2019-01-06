defmodule Percentages do
  @moduledoc """
  """

  @doc """
  Returns a list of percentages that will produce a whole number when applied to the total.

  This is done by a brute force approach because I don't know how else to do it, but we can narrow
  our search space by saying that the number of decimal places is related to the number of digits in
  the total. N - 2 where N is the total number of digits.

  We can safely assume that the total will be a whole number, because we are operating on discrete
  data set.

  ### Examples

  Imagine our total is 2. The only %ages that produce a whole number are 50%, 0%, 100%

      iex> that_produce_whole_numbers_for(2)
      [100.0, 50.0, 0.0]

      iex> that_produce_whole_numbers_for(10)
      [100.0, 90.0, 80.0, 70.0, 60.0, 50.0, 40.0, 30.0, 20.0, 10.0, 0.0]
  """
  def that_produce_whole_numbers_for(total) when is_integer(total) do
    0..total
    |> Enum.reduce([], fn x, acc ->
      [100 * x / total | acc]
    end)
  end

  def that_produce_whole_numbers_for(total = %Decimal{exp: 0, coef: coef}) do
    0..coef
    |> Enum.reduce([], fn x, acc ->
      [Decimal.new("100") |> Decimal.mult(Decimal.new("#{x}")) |> Decimal.div(total) | acc]
    end)
  end
end
