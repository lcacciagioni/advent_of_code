input = '6.txt' |> File.stream! |> Enum.to_list

:ets.new(:matrix, [:set, :protected, :named_table])

for x <- 0..999, y <- 0..999 do
  :ets.insert(:matrix, {{x, y}, false})
end

defmodule Lights do
  def count([line|rest_lines]) do
    str_line = line |> to_string |> String.trim
    if String.starts_with?(str_line ,"toggle") do
      [_, start_pos, _, end_pos] = str_line |> String.split(" ")
      [x1, y1] = start_pos |> String.split(",")
      [x2, y2] = end_pos |> String.split(",")
      for x <- String.to_integer(x1)..String.to_integer(x2), y <- String.to_integer(y1)..String.to_integer(y2) do
        case :ets.lookup(:matrix, {x,y}) do
          [{{_,_}, true}] -> :ets.insert(:matrix, {{x, y}, false})
          [{{_,_}, false}] -> :ets.insert(:matrix, {{x, y}, true})
        end

      end
    end
    if String.starts_with?(str_line, "turn off") do
       [_, _, start_pos, _, end_pos] = str_line |> String.split(" ")
       [x1, y1] = start_pos |> String.split(",")
       [x2, y2] = end_pos |> String.split(",")
       for x <- String.to_integer(x1)..String.to_integer(x2), y <- String.to_integer(y1)..String.to_integer(y2) do
         :ets.insert(:matrix, {{x, y}, false})
       end
    end
    if String.starts_with?(str_line, "turn on") do
      [_, _, start_pos, _, end_pos] = str_line |> String.split(" ")
      [x1, y1] = start_pos |> String.split(",")
      [x2, y2] = end_pos |> String.split(",")
      for x <- String.to_integer(x1)..String.to_integer(x2), y <- String.to_integer(y1)..String.to_integer(y2) do
        :ets.insert(:matrix, {{x, y}, true})
      end
    end
    count(rest_lines)
  end

  def count([]) do
    IO.puts :ets.tab2list(:matrix) |> Enum.filter(fn({{_,_}, x})-> x end) |> Enum.count
  end
end

Lights.count(input)
