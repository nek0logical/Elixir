defmodule EngineMonitor do

  def latest([head | tail]), do: head

  def new_reading(new, readings) do
    [new | readings]
  end

  def max_reading([head | []]), do: head

  def max_reading([head | tail]) do
    max(head, max_reading(tail))
  end


end
