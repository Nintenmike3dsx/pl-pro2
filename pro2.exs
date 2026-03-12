defmodule Project2 do

  # Splits sentences at every . ! or ? and removes whitespace
  def sentences(text),
    do: text |> String.split(~r/[.!?]+/) |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

end

IO.puts("Enter sentance to split (testing):")
input = IO.gets("") |> String.trim()
IO.inspect Project2.sentences(input)
