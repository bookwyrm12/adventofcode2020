defmodule AdventOfCode.Day01 do
  def parse_input(input) do
    Enum.map(String.split(input, "\n", trim: true), fn x -> String.to_integer(x) end)
  end

  def part1(args) do
    # entries = [1721, 979, 366, 299, 675, 1456]
    entries = parse_input(args)
    IO.inspect binding()
    {result1, result2} = find_entries(0, 1, entries)
    result1 * result2
  end

  def find_entries(xi, yi, entries) do
    x = Enum.at(entries, xi)
    y = Enum.at(entries, yi)
    IO.inspect binding()
    cond do
      x + y == 2020 ->
        {x, y}
      yi >= length(entries) - 1 ->
        find_entries(xi + 1, xi + 2, entries)
      true ->
        find_entries(xi, yi + 1, entries)
    end
  end

  def part2(args) do
    entries = parse_input(args)
    IO.inspect binding()
    {result1, result2, result3} = find_entries(0, 1, 2, entries)
    result1 * result2 * result3
  end

  def find_entries(xi, yi, zi, entries) do
    x = Enum.at(entries, xi)
    y = Enum.at(entries, yi)
    z = Enum.at(entries, zi)
    IO.inspect binding()
    cond do
      x + y + z == 2020 ->
        {x, y, z}
      yi >= length(entries) - 2 ->
        find_entries(xi + 1, xi + 2, xi + 3, entries)
      zi >= length(entries) - 1 ->
        find_entries(xi, yi + 1, yi + 2, entries)
      true ->
        find_entries(xi, yi, zi + 1, entries)
    end
  end
end
