defmodule Fun do
  @moduledoc """
  A collection of functions to allow your code to be more functional
  """

  @doc """
  See Fun.compose_l

  """
  defdelegate compose(functions), to: __MODULE__, as: :compose_l

  @doc """
  See Fun.compose_l

  ## Examples

  #iex> rev_up = &String.reverse/1 | &String.upcase/1
  #iex> rev_up.("danny")
  #""

  """
  def fun1 ~> fun2 do
    compose_l([fun1, fun2])
  end

  @doc """
  Composes input functions by applying them from left to right on the input

  ## Examples

      iex> prefix = Fun.compose_l([&String.upcase/1, fn x -> String.slice(x, 0..2) end])
      iex> prefix.("danny is awesome")
      "DAN"

  """
  def compose_l(functions) when is_list(functions) do
    fn arg -> compose_apply(functions, arg) end
  end

  @doc """
  Composes input functions by applying them from right to left on the input

  ## Examples

      iex> add_and_mult = Fun.compose_r([&(&1 * 10), &(&1 + 5)])
      iex> add_and_mult.(3)
      80

  """
  def compose_r(functions) when is_list(functions) do
    functions |> Enum.reverse |> compose_l
  end

  def compose_apply([], arg), do: arg
  def compose_apply([fun | functions], arg) do
    compose_apply functions, apply(fun, [arg])
  end

  @doc """
  The identity function returns the input arguments unchanged

  ## Examples

      iex> Fun.id(:awesome)
      :awesome

  """
  def id(x), do: x
end
