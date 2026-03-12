defmodule Project2 do

  # Splits Sentences at Every . ! or ? and Removes Extra Space
  def sentences(text),
    do: text |> String.split(~r/[.!?]+/) |> Enum.map(&String.trim/1) |> Enum.reject(&(&1 == ""))

  # Gets Rid of Punctuation and Forces Lowercase (for different word counting)
  def words(text),
    do: text |> String.downcase() |> String.replace(~r/[^a-z\s]/, "") |> String.split()

  # Count each word
  def freq([]), do: %{}
  def freq([h | t]), do: freq(t) |> Map.update(h, 1, fn n -> n + 1 end)

  # Extra - Average Word Length
  def avg(words),
    do: words |> Enum.map(&String.length/1) |> Enum.reduce(0, fn n, acc -> acc + n end) |> then(fn total -> total / length(words) end)

  def run(text) do
    words = words(text) # List of Words
    freq  = freq(words) # Count How Often Each Word Appears
    top5  = freq |> Enum.sort_by(fn {_, n} -> n end, :desc) |> Enum.take(3) # sort by count and take top 3 words

    IO.puts("Words: #{length(words)}") # Total Word Count
    IO.puts("Sentences: #{length(sentences(text))}") # Total Sentence Count
    IO.puts("Unique: #{map_size(freq)}") # Number of Different Words
    IO.puts("\nTop 3 words:") # Top 3 Words
    Enum.each(top5, fn {word, n} -> IO.puts("  #{word}: #{n}") end) # Display Each Top Word and How Many Times it Came Up
    IO.puts("Average Word Length: #{Float.round(avg(words), 1)} characters") # Average Word Length
  end
end

IO.puts("Enter your sentence:") # Prompt user for sentence
input = IO.gets("") |> String.trim()  # Read Input

Project2.run(input)  # Run baby run
