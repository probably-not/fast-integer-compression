defmodule FastIntegerCompression.Signed.Sizer do
  @moduledoc false

  alias FastIntegerCompression.Utils

  @spec expected_compressed_size(list(integer())) :: non_neg_integer()
  def expected_compressed_size(lst) do
    for v <- lst, reduce: 0 do
      acc -> acc + Utils.bytelog(Utils.zigzag_encode(v))
    end
  end
end
