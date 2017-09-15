defmodule Fun do
  @moduledoc """
  A collection of functions to allow your code to be more functional
  """

  @doc """
  compose

  ## Examples

      iex> prefix = Fun.compose([&String.upcase/1, fn x -> String.slice(x, 0..2) end])
      iex> prefix.("danny is awesome")
      "DAN"

  """
  def compose(functions) when is_list(functions) do
    fn arg -> compose_apply(functions, arg) end
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
