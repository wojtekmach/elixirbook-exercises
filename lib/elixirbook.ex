defmodule Elixirbook do
  @doc """
  iex> Elixirbook.map([1, 2, 3], &(&1 * 2))
  [2, 4, 6]
  """
  def map([], _f), do:      []
  def map([x | xs], f), do: [ f.(x) | map(xs, f) ]

  @doc """
  iex> Elixirbook.sum([1, 2, 3])
  6
  """
  def sum(xs),              do: sum(xs, 0)
  def sum([], total),       do: total
  def sum([x | xs], total), do: sum(xs, x + total)

  @doc """
  iex> Elixirbook.mapsum([1, 2, 3], &(&1 * &1))
  14
  """
  def mapsum([], _f),      do: 0
  def mapsum([x | xs], f), do: f.(x) + mapsum(xs, f)

  @doc """
  iex> Elixirbook.max([1, 2, 3])
  3

  iex> Elixirbook.max([1, 3, 2])
  3
  """
  def max([x | []]), do: x
  def max([x | xs]), do: Kernel.max(x, max(xs))

  @doc """
  iex> Elixirbook.caesar('ryvkve', 13)
  'elixir'
  """
  def caesar(str, n), do: Enum.map(str, &(caesar_char(&1, n)))
  defp caesar_char(char, n) when char + n <= ?z, do: char + n
  defp caesar_char(char, n),                     do: char + n - 26

  @doc """
  iex> Elixirbook.swap([1,2,3,4,5,6])
  [2,1,4,3,6,5]

  iex> Elixirbook.swap([1])
  ** (ArgumentError) Can't swap a list with an odd number of elements
  """
  def swap([]),            do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]),           do: raise(ArgumentError, message: "Can't swap a list with an odd number of elements")

  @doc """
  iex> Elixirbook.span(2, 5)
  [2, 3, 4, 5]
  """
  def span(a, b) when a > b, do: []
  def span(from, to),        do: [from | span(from + 1, to)]

  @doc """
  iex> Elixirbook.all?([1, 2, 3], &Integer.is_odd/1)
  false

  iex> Elixirbook.all?([1, 3], &Integer.is_odd/1)
  true
  """
  def all?([], _f),           do: true
  def all?([head | tail], f), do: f.(head) && Elixirbook.all?(tail, f)

  @doc """
  iex> Elixirbook.filter([1, 2, 3], &Integer.is_odd/1)
  [1, 3]
  """
  def filter([], _f),           do: []
  def filter([head | tail], f), do: pred(head, f) ++ Elixirbook.filter(tail, f)
  defp pred(x, f), do: (if f.(x) do [x] else [] end)

  # @doc """
  # iex> Elixirbook.split([1, 2, 3], 2)
  # {[1,2], [3]}
  
  # iex> Elixirbook.split([1, 2, 3], 10)
  # {[1,2,3], []}
  
  # iex> Elixirbook.split([1, 2, 3], 0)
  # {[], [1,2,3]}
  
  # iex> Elixirbook.split([1, 2, 3], -1)
  # {[1,2], [3]}
  
  # iex> Elixirbook.split([1, 2, 3], -5)
  # {[], [1,2,3]}
  # """
  # def split([], x),            do: {[], []}
  # def split([head | tail], x) when 

  @doc """
  iex> Elixirbook.take([1,2,3,4,5], 3)
  [1,2,3]
  """
  def take(collection, count), do: _take(collection, [], count, 0)
  def _take([], _my, _count, _n), do: []
  def _take([head | tail], my, count, n) when n == count - 1, do: my ++ [head]
  def _take([head | tail], my, count, n) when n < count,      do: _take(tail, my ++ [head], count, n + 1)
end
