defmodule FastIntegerCompressionTest do
  use ExUnit.Case
  doctest FastIntegerCompression

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression)
  end
end
