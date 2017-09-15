defmodule FunTest do
  use ExUnit.Case
  doctest Fun

  test "greets the world" do
    assert Fun.hello() == :world
  end
end
