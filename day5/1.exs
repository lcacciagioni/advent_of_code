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
    is_valid = check_invalid_pairs(cl_line)
    if [vowels,has_double,is_valid] === [true,true,true] do
      IO.puts line |> to_string
      count(tail, good_lines + 1)
    else
      count(tail, good_lines)
    end
  end

  defp check_vowels(line) do
    has_a = Enum.member?(line, ?a)
    has_e = Enum.member?(line, ?e)
    has_i = Enum.member?(line, ?i)
    has_o = Enum.member?(line, ?o)
    has_u = Enum.member?(line, ?u)

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
    if first == second do
      true
    else
      check_double(tail)
    end
  end

  defp check_invalid_pairs([_]) do
    true
  end

  defp check_invalid_pairs(line) do
    [first|tail] = line
    [second|_] = tail
    case [first,second] do
       [?a,?b] -> false
       [?c,?d] -> false
       [?p,?q] -> false
       [?x,?y] -> false
       _ -> check_invalid_pairs(tail)
    end
  end
end

IO.puts NiceString.count(input) |> to_string
