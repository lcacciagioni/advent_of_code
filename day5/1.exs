input = '5.txt' |> File.stream! |> Enum.to_list

defmodule NiceString do
  def count(lines) do
    count(lines, 0)
  end

  def count([], good_lines) do
    good_lines
  end

  def count([line|tail], good_lines) do
    cl_line = line |> to_charlist |> Enum.filter(fn ch -> ch != ?\n end)
    vowels = check_vowels(cl_line)
    has_double = check_double(cl_line)
    is_valid = !String.contains? cl_line |> to_string, ["ab","cd","pq","xy"]
    if [vowels,has_double,is_valid] === [true,true,true] do
      count(tail, good_lines + 1)
    else
      count(tail, good_lines)
    end
  end

  defp check_vowels(line) do
    length(for n <- line, n in [?a, ?e, ?i, ?o, ?u], do: n) > 2
  end

  defp check_double([_]) do
    false
  end

  defp check_double(line) do
    [first|tail] = line
    [second|_] = tail
    if first === second do
      true
    else
      check_double(tail)
    end
  end
end

IO.puts NiceString.count(input)
