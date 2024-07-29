defmodule FastIntegerCompressionTest do
  use ExUnit.Case
  doctest FastIntegerCompression

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression)
  end

  test "expected number of integers (unsigned)" do
    lst = [10, 100_000, 65_999, 10, 10, 0, 1, 1, 2000, 0xFFFFFFFF]
    compressed = FastIntegerCompression.Unsigned.compress(lst)
    assert FastIntegerCompression.expected_number_of_integers(compressed) == length(lst)
  end

  test "expected number of integers (signed)" do
    lst = [10, 100_000, 65_999, 10, 10, 0, -1, -1, -2000]
    compressed = FastIntegerCompression.Signed.compress(lst)
    assert FastIntegerCompression.expected_number_of_integers(compressed) == length(lst)
  end
end
