defmodule FastIntegerCompressionTest.UnsignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Unsigned

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Unsigned)
  end
end
