input = '1.txt' |> File.read! |> to_charlist



defmodule Santa do
  def santa_floor([], _ ,pos) do
    IO.puts "No position lead you to the basement"
    pos
  end
  def santa_floor([head | tail], sum, pos) when head == ?( and sum != -1 do
    santa_floor(tail, sum + 1, pos + 1)
  end
  def santa_floor([head | tail], sum, pos) when head == ?) and sum != -1 do
    santa_floor(tail, sum - 1, pos + 1)
  end
  def santa_floor(_, sum, pos) when sum == -1 do
    pos
  end
  def santa_floor([_ | tail], sum, pos) do
    santa_floor(tail, sum, pos)
  end

end

IO.puts Santa.santa_floor(input, 0, 0)
