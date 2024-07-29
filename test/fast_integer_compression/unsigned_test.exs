defmodule FastIntegerCompressionTest.UnsignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Unsigned
  alias FastIntegerCompression.Unsigned

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Unsigned)
  end

  test "expected_compressed_size" do
    assert Unsigned.expected_compressed_size([
             10,
             100_000,
             65999,
             10,
             10,
             0,
             1,
             1,
             2000,
             0xFFFFFFFF
           ]) == 19
  end
end
