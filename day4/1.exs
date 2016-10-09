input = "yzbqklnj"

defmodule AdventCoins do
  def find_first(base) do
    find_first(base, 0)
  end
  def find_first(base, number) do
    first5 = Enum.slice(:crypto.hash(:md5, "#{base}#{number}") |> Base.encode16 |> to_charlist, 0, 5) |> to_string
    case first5 do
      "00000" -> IO.puts "The number is: #{number}"
      _ -> find_first(base, number + 1)
    end
  end
end

AdventCoins.find_first(input)
