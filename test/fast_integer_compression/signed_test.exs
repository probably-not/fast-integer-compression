defmodule FastIntegerCompressionTest.SignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Signed

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Signed)
  end
end
