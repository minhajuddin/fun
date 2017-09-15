defmodule FunTest do
  use ExUnit.Case
  doctest Fun

  describe "map_ok" do
  end

  describe "compose" do

    test "allows composing of 2 functions" do
      ten_times_length = Fun.compose([&String.length/1, fn x -> x * 10 end])
      assert ten_times_length.("danny") == 50
    end

  end
end
