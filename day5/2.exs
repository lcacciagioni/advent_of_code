input = '5.txt' |> File.stream! |> Enum.to_list

defmodule NiceString do
  @double for n <- ?a..?z, x <- ?a..?z, do: to_string [n,x]
  @triple for n <- ?a..?z, x <- ?a..?z, do: to_string [n,x,n]

  def count(lines) do
    count(lines, 0)
  end

  def count([], good_lines) do
    good_lines
  end

  def count([line|tail], good_lines) do
    cl_line = line |> to_charlist |> Enum.filter(fn ch -> ch != ?\n end) |> to_string
    doubles = cont_doubles(cl_line)
    triplets = cont_triples(cl_line)

    if [doubles, triplets] === [true, true] do
      count(tail, good_lines + 1)
    else
      count(tail, good_lines)
    end
  end

  defp cont_doubles(line) do
    !!Enum.find @double, false, &(length(String.split(line, &1)) > 2)
  end

  defp cont_triples(line) do
    !!Enum.find @triple, false, &(String.contains?(line, &1))
  end
end

IO.puts NiceString.count(input)
