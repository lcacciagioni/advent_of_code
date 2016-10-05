input = '2.txt' |> File.stream! |> Enum.to_list

defmodule Present do
  def count([], sum) do
    sum
  end
  def count([line|rest], sum) do
    [l, w, h] = Enum.map(String.split(String.trim(line),["x"]), &String.to_integer(&1))
    new_sum = 2*l*w + 2*w*h + 2*h*l + Enum.min([l*w,w*h,h*l])
    count(rest, sum + new_sum)
  end
end

IO.puts Present.count(input, 0)
