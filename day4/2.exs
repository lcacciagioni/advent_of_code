input = "yzbqklnj"

defmodule AdventCoins do
  def find_first(base) do
    find_first(base, 0)
  end
  def find_first(base, number) do
    first6 = Enum.slice(:crypto.hash(:md5, "#{base}#{number}") |> Base.encode16 |> to_charlist, 0, 6) |> to_string
    case first6 do
      "000000" -> IO.puts "The number is: #{number}"
      _ -> find_first(base, number + 1)
    end
  end
end

AdventCoins.find_first(input)
