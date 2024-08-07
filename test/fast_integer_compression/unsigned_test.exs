defmodule FastIntegerCompressionTest.UnsignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Unsigned
  alias FastIntegerCompression.Unsigned

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Unsigned)
  end

  test "expected_compressed_size" do
    original = [10, 100_000, 65_999, 10, 10, 0, 1, 1, 2000, 0xFFFFFFFF]
    assert Unsigned.expected_compressed_size(original) == 19
  end

  test "compression" do
    compressed = Unsigned.compress([10, 100_000, 65_999, 10, 10, 0, 1, 1, 2000, 0xFFFFFFFF])
    assert byte_size(compressed) == 19
  end

  test "decompression" do
    original = [10, 100_000, 65_999, 10, 10, 0, 1, 1, 2000, 0xFFFFFFFF]
    compressed = Unsigned.compress(original)
    decompressed = Unsigned.decompress(compressed)
    assert ^original = decompressed
  end

  for i <- 1..50//1 do
    test "fuzzish_#{i}" do
      count = :rand.uniform(1000)

      original =
        Stream.repeatedly(fn -> Enum.random(0..2_000_000_000//1) end) |> Enum.take(count)

      expected_size = Unsigned.expected_compressed_size(original)
      compressed = Unsigned.compress(original)
      decompressed = Unsigned.decompress(compressed)

      assert byte_size(compressed) == expected_size
      assert FastIntegerCompression.expected_number_of_integers(compressed) == count
      assert ^original = decompressed
    end
  end
end
