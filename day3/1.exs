input = '3.txt' |> File.read! |> to_charlist |> Enum.filter(fn ch -> ch != ?\n end)

defmodule TwoDim do
  def calc([], position_list) do
    position_list |> Enum.uniq |> Enum.count
  end

  def calc([head|tail], position_list) when head == ?^ do
    [[x, y] | _ ] = position_list
    calc(tail, [[x, y + 1] | position_list ] )
  end

  def calc([head|tail], position_list) when head == ?v do
    [[x, y] | _ ] = position_list
    calc(tail, [[x, y - 1] | position_list ] )
  end

  def calc([head|tail], position_list) when head == ?> do
    [[x, y] | _ ] = position_list
    calc(tail, [[x + 1, y] | position_list ] )
  end

  def calc([head|tail], position_list) when head == ?< do
    [[x, y] | _ ] = position_list
    calc(tail, [[x - 1, y] | position_list ] )
  end

  def calc([_|tail], position_list) do
    calc(tail, position_list)
  end
end

IO.puts TwoDim.calc(input, [[0,0]])
