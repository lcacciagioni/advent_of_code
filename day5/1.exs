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
    new_line = line |> to_string
    has_a = String.contains? new_line, "a"
    has_e = String.contains? new_line, "e"
    has_i = String.contains? new_line, "i"
    has_o = String.contains? new_line, "o"
    has_u = String.contains? new_line, "u"

    if Enum.count([has_a,has_e,has_i,has_o,has_u], fn(x) -> x === true end) >= 3 do
      true
    else
      false
    end
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

IO.puts NiceString.count(input) |> to_string
