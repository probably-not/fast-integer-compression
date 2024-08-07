defmodule FastIntegerCompressionTest.SignedTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Signed
  alias FastIntegerCompression.Signed

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Signed)
  end

  test "expected_compressed_size" do
    original = [10, 100_000, 65_999, 10, 10, 0, -1, -1, -2000]
    assert Signed.expected_compressed_size(original) == 14
  end

  test "compression" do
    compressed = Signed.compress([10, 100_000, 65_999, 10, 10, 0, -1, -1, -2000])
    assert byte_size(compressed) == 14
  end

  test "decompression" do
    original = [10, 100_000, 65_999, 10, 10, 0, -1, -1, -2000]
    compressed = Signed.compress(original)
    decompressed = Signed.decompress(compressed)
    assert ^original = decompressed
  end

  for i <- 1..50//1 do
    test "fuzzish_#{i}" do
      count = :rand.uniform(1000)

      original =
        Stream.repeatedly(fn -> Enum.random(-2_000_000_000..2_000_000_000//1) end)
        |> Enum.take(count)

      expected_size = Signed.expected_compressed_size(original)
      compressed = Signed.compress(original)
      decompressed = Signed.decompress(compressed)

      assert byte_size(compressed) == expected_size
      assert FastIntegerCompression.expected_number_of_integers(compressed) == count
      assert ^original = decompressed
    end
  end
end
