defmodule QuickSort do

  def quicksort([]), do: []

  def quicksort([head | tail]) do
    quicksort(for x <- tail, x < head, do: x) ++ [head] ++ quicksort(for x <- tail, x >= head, do: x)
  end

end
