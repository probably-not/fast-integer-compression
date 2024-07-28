defmodule FastIntegerCompressionTest.UtilsTest do
  use ExUnit.Case
  doctest FastIntegerCompression.Utils
  alias FastIntegerCompression.Utils

  test "code loaded" do
    assert Code.loaded?(FastIntegerCompression.Utils)
  end

  describe "bytelog" do
    test "correctness" do
      assert Utils.bytelog(1) == 1
      assert Utils.bytelog(2) == 1
      assert Utils.bytelog(1_000) == 2
      assert Utils.bytelog(10_000) == 2
      assert Utils.bytelog(21_312) == 3
      assert Utils.bytelog(100_000_000) == 4
      assert Utils.bytelog(21_312_312_312_312_312_312) == 5
    end
  end

  describe "zigzag_encoding" do
    test "correctness" do
      assert Utils.zigzag_encode(1) == 2
      assert Utils.zigzag_encode(-1) == 1
      assert Utils.zigzag_encode(-1_321_231) == 2_642_461
      assert Utils.zigzag_encode(1_321_231) == 2_642_462
    end
  end

  describe "zigzag_decoding" do
    test "correctness" do
      assert Utils.zigzag_decode(2) == 1
      assert Utils.zigzag_decode(1) == -1
      assert Utils.zigzag_decode(2_642_461) == -1_321_231
      assert Utils.zigzag_decode(2_642_462) == 1_321_231
    end
  end
end
