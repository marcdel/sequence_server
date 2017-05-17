defmodule SequenceTest do
  use ExUnit.Case

  setup do
    Sequence.Server.clear
  end

  test "starts at 0" do
    assert Sequence.Server.next_number == 0
  end

  test "increment by 1" do
    assert Sequence.Server.next_number == 0
    assert Sequence.Server.next_number == 1
    assert Sequence.Server.next_number == 2
  end

  test "increment sets the delta" do
    Sequence.Server.increment_number(10)
    assert Sequence.Server.next_number == 10
    assert Sequence.Server.next_number == 20

    Sequence.Server.increment_number(5)
    assert Sequence.Server.next_number == 35
    assert Sequence.Server.next_number == 40
  end
end
