input = '2.txt' |> File.stream! |> Enum.to_list

defmodule Present do
  def count([], sum) do
    sum
  end
  def count([line|rest], sum) do
    [l, w, h] = Enum.map(String.split(String.trim(line),["x"]), &String.to_integer(&1))
    [m1, m2, _] = Enum.sort([l, w, h])
    new_sum = l*w*h + 2*m1 + 2*m2
    count(rest, sum + new_sum)
  end
end

IO.puts Present.count(input, 0)
