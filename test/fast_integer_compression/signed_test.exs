defmodule FastIntegerCompressionTest.SignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Signed
  alias FastIntegerCompression.Signed

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Signed)
  end

  test "expected_compressed_size" do
    assert Signed.expected_compressed_size([10, 100_000, 65999, 10, 10, 0, -1, -1, -2000]) == 14
  end
end
