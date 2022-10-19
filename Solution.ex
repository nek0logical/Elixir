defmodule Solution do

    def sum([head | []] ), do: head

    def sum([head | tail]) do
        head + sum(tail)
    end

end
