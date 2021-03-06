defmodule FunTest do
  use ExUnit.Case
  doctest Fun

  describe "id" do
    test "returns input" do
      import Fun
      assert 10 |> id == 10
      assert 10 |> id |> id == 10 |> id
    end
  end

  describe "compose_l" do

    test "allows composing of 2 functions" do
      ten_times_length = Fun.compose_l([&String.length/1, fn x -> x * 10 end])
      assert ten_times_length.("danny") == 50
    end

    test "allows composing of enum funcs" do
      mult_5_and_add_3 = Fun.compose_l([
        &(&1 * 5),
        &(&1 + 3),
      ])
      assert mult_5_and_add_3.(1) == 8
      assert 1..3 |> Enum.map(mult_5_and_add_3) == [8, 13, 18]
    end

    test "allows using of operators" do
      import Fun
      rev_up = (&String.reverse/1) ~> (&String.upcase/1)
      assert rev_up.("danny") == "YNNAD"
      up = (&String.reverse/1) ~> (&String.upcase/1) ~> (&String.reverse/1)
      assert up.("danny") == "DANNY"
    end

  end

  describe "compose_r" do

    test "allows composing of 2 functions" do
      ten_times_length = Fun.compose_r([fn x -> x * 10 end, &String.length/1])
      assert ten_times_length.("danny") == 50
    end

    test "allows composing of enum funcs" do
      mult_5_and_add_3 = Fun.compose_r([
        &(&1 * 5),
        &(&1 + 3),
      ])
      assert mult_5_and_add_3.(1) == 20
      assert 1..3 |> Enum.map(mult_5_and_add_3) == [20, 25, 30]
    end

  end
end
