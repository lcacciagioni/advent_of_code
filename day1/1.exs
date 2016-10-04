input = '1.txt' |> File.read! |> to_charlist



defmodule Santa do
  open = to_charlist('(')
  close = to_charlist(')')
  def santa_floor([],sum) do
    sum
  end
  def santa_floor([head | tail], sum) do
    santa_floor(tail, sum + 1)
  end
  def santa_floor([head | tail], sum) do
    santa_floor(tail, sum - 1)
  end
  def santa_floor([_ | tail], sum) do
    santa_floor(tail, sum)
  end
end


IO.puts Santa.santa_floor(input, 0)
