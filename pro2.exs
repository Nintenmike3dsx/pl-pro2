defmodule Project2 do

  # Splits sentences at every . ! or ? and removes whitespace
  def sentences(text),
    do: text |> String.split(~r/[.!?]+/) |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

  # Gets rid of punctuation and then splits the text into a list of words
  def words(text),
    do: text |> String.downcase() |> String.replace(~r/[^a-z\s]/, "") |> String.split()
  # Count each word
  def freq([]), do: %{}        # Empty List
  def freq([h | t]), do: freq(t) |> Map.update(h, 1, fn n -> n + 1 end)  # Count each word

  def run(text) do
    words = words(text) # get list of words
    freq  = freq(words) # count how often each word appears
    top5  = freq |> Enum.sort_by(fn {_, n} -> n end, :desc) |> Enum.take(3) # sort by count and take top 3 words

    IO.puts("Words: #{length(words)}") # Total Word Count
    IO.puts("Sentences: #{length(sentences(text))}") # Total Sentance Count
    IO.puts("Unique: #{map_size(freq)}") # Number of different words
    IO.puts("\nTop 3 Common Words:") # Top 3 Words
    Enum.each(top5, fn {word, n} -> IO.puts("  #{word}: #{n}") end) # Display Each Top Word and How Many Times it Came Up
  end
end

IO.puts("Enter your sentence:") # Prompt user for sentance
input = IO.gets("") |> String.trim()  # Read Input

Project2.run(input)  # Run baby run
