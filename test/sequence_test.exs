defmodule SequenceTest do
  use ExUnit.Case

  setup do
    Sequence.Server.set_number(1)
  end

  test "starts at 1" do
    assert Sequence.Server.next_number == 1
  end

  test "increment by 1" do
    assert Sequence.Server.next_number == 1
    assert Sequence.Server.next_number == 2
    assert Sequence.Server.next_number == 3
  end

  test "increment by an amount" do
    Sequence.Server.increment_number(10)
    assert Sequence.Server.next_number == 11

    Sequence.Server.increment_number(3)
    assert Sequence.Server.next_number == 15
  end
end
