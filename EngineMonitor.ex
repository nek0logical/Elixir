defmodule EngineMonitor do

  # latest - Returns latest reading, which is head of list
  def latest([head | tail]), do: head

  # new_reading - adds a new reading to the start of the list
  def new_reading(new, readings), do: [new | readings]

  def max_reading([head | tail], max) when head > max, do: max_reading(tail, head)

  def max_reading([head | tail], max), do: max_reading(tail, max)

  def max_reading([], max), do: max

  def max_reading(list), do: max_reading(list, 0)


  def rising([head | [ next | tail]], risen) when head > next, do: rising([next | tail], risen+1)

  def rising([head | [next | tail]], risen), do: rising([next | tail], risen)

  def rising([head | []], risen), do: risen

  def rising([], risen), do: risen

  def rising(list), do: rising(list, 0)

  # danger? - Returns :true if any adjacent readings differ by >= 50, :false otherwise

  # Base Case 1 -> One element list, nothing to compare to, return bool
  def danger?([_head | []]), do: false

  # Base Case 2 -> Danger reading
  def danger?([head | [next | _tail]]) when head - next |> abs >= 50, do: true

  # Base Case 3 -> No danger reading, more readings to check
  def danger?([_head | tail]), do: danger?(tail)


  def fire?(string), do: String.upcase(string, :ascii) |> String.contains?("FIRE")

  # decode/1 - output word made up of first letter of each word in input string

  # Wrapper - accept input string, split into list of words, assuming words seperated by whitespace
  def decode(string) when is_binary(string), do: String.split(string, " ") |> decode()

  # Base Case 1 -> One word in list, return first letter
  def decode([head | []]), do: String.first(head)

  # Base Case 2 -> More words in list to get
  def decode([head | tail]), do: String.first(head) <> decode(tail)

end
