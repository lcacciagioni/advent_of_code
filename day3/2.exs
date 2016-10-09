input = '3.txt' |> File.read! |> to_charlist |> Enum.filter(fn ch -> ch != ?\n end)

defmodule TwoDim do

  def calc([], position_list) do
    position_list |> Enum.uniq |> Enum.count
  end

  def calc([head|tail], position_list) do
    [[_,_],[x,y]|_] = position_list
    calc(tail, [count(head, [x,y])|position_list])
  end

  # In this part we do the individual calculation
  defp count(step, [x, y]) when step == ?^ do
    [x, y + 1]
  end
  defp count(step, [x, y]) when step == ?v do
    [x, y - 1]
  end
  defp count(step, [x, y]) when step == ?> do
    [x + 1, y]
  end
  defp count(step, [x, y]) when step == ?< do
    [x - 1, y]
  end
  defp count(_,[x, y]) do
    [x, y]
  end
end

IO.puts TwoDim.calc(input, [[0,0],[0,0]])
