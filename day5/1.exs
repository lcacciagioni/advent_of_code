input = '5.txt' |> File.stream! |> Enum.to_list

atoz="abcdefghijklmnopqrstuvwxyz"

defmodule NiceString do
  def find(lines) do
    IO.puts "#{lines}"
  end

  defp check_vowels(line) do
    has_a = Enum.member?(line, ?a)
    has_e = Enum.member?(line, ?e)
    has_i = Enum.member?(line, ?i)
    has_o = Enum.member?(line, ?o)
    has_u = Enum.member?(line, ?u)

    sum = sum_vowels([has_a, has_e, has_i, has_o, has_u], 0)
    if sum >= 3 do
      true
    else
      false
    end
  end

  defp sum_vowels([], sum) do
    sum
  end
  defp sum_vowels([head|tail], sum) when head == true do
    sum_vowels(tail, sum + 1)
  end
  defp sum_vowels([_|tail], sum) do
    sum_vowels(tail, sum)
  end

  def check_double(_, []) do
    IO.puts "Done!!!"
  end

  def check_double(line, [head|tail]) do
    IO.puts "#{line} | #{head}"
    check_double(line, tail)
  end
end

NiceString.check_double("hola",atoz)
